<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.rtl.min.css" integrity="sha384-dpuaG1suU0eT09tx5plTaGMLBsfDLzUCCUXOY2j/LSvXYuG6Bqs43ALlhIqAJVRb" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.min.css">

    <title>Soal Test Web Developer Ubaed</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="card" style="margin-top: 25px;">
            <div class="card-header">
                <div class="d-flex justify-content-between">
                    <h4>Data Output Sewing</h4>
                </div>
            </div>
            <div class="card-body">
                <table class="table" id="table_output_sewing" style="width: 100%;">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">Date</th>
                            <th scope="col" class="text-center">Style</th>
                            <th scope="col" class="text-center">Total Size</th>
                            <th scope="col" class="text-center">Total Output</th>
                            <th scope="col" class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
      </div>

      <div id="detailSewing" style="margin-top: 25px;"></div>
    </div>

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
    <!-- SweetAlert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        // Menampilkan data sewing ke dalam table table_output_sewing
        $(document).ready(function() {
            $('#table_output_sewing').DataTable({
                responsive: true,
                processing: true,
                serverSide: true,
                ajax: "{{ route('data.sewing') }}",
                columns: [
                    {data: 'tanggal', name: 'tanggal', render: function (data, type, row) {
                        return `<p class="text-center">${row.tanggal}</p>`
                    }},
                    {data: 'style_code', name: 'style_code', render: function (data, type, row) {
                        return `<p class="text-center">${row.style_code}</p>`
                    }},
                    {data: 'total_size', name: 'total_size', render: function (data, type, row) {
                        return `<p class="text-center">${row.total_size}</p>`;
                    }},
                    {data: 'total_output', name: 'total_output', render: function (data, type, row) {
                        return `<p class="text-center">${row.total_output}</p>`;
                    }},
                    {data: null, orderable: false, render: function (data, type, row) {
                        return `
                            <div class="text-center">
                                <a href="#" class="btn btn-md btn-info detail-data-sewing" data-tanggal="${row.tanggal}" data-style="${row.style_code}">Detail</a>
                            </div>
                        `
                    }},
                ],
                createdRow: function (row, data, dataIndex) {
                    $(row).addClass('iteration-row');
                }
            });
        });

        $(document).on('click', '.detail-data-sewing', function(e) {
            e.preventDefault();
            var button = $(this);
            var dataTanggal = button.data('tanggal');
            var dataStyle = button.data('style');
            var detailUrl = "{{ url('/detailSewing') }}/" + dataTanggal + "/" + dataStyle;

            $.ajax({
                url: detailUrl,
                type: 'PUT',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    $('#detailSewing').empty();

                    var sizeQtyMap = {};
                    var sizeNames = [];

                    if (dataStyle === 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9') {
                        sizeNames = ['92', '98', '104', '110', '116', '122', '128', '134', '140', '146', '152'];
                    } else if (dataStyle === 'BOSSE FANCY OH HOOD S.9') {
                        sizeNames = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
                    } else {
                        $.each(response, function(index, item) {
                            $.each(item.cek, function(idx, cek) {
                                if (!sizeQtyMap[cek.size_name]) {
                                    sizeQtyMap[cek.size_name] = true;
                                }
                            });
                        });
                        sizeNames = Object.keys(sizeQtyMap);
                    }

                    var tableHtml = '<div class="card">';
                    tableHtml += '<div class="card-body">';
                    tableHtml += '<h5 class="card-title">'+ dataStyle +' #'+ dataTanggal +'</h5>';
                    tableHtml += '<h5 class="card-title" style="color: blue; margin-top: 10px;"><u>Detail Transaction:</u></h5>';
                    tableHtml += '<div class="table-responsive">';
                    tableHtml += '<table class="table">';
                    tableHtml += '<thead>';
                    tableHtml += '<tr>';
                    tableHtml += '<th rowspan="2">Operator</th>';
                    tableHtml += '<th colspan="' + sizeNames.length + '" style="text-align: center;">Sizes</th>';
                    tableHtml += '<th rowspan="2" style="text-align: center;">Total Qty Output</th>';
                    tableHtml += '<th rowspan="2">Destination</th>';
                    tableHtml += '</tr>';
                    tableHtml += '<tr>';

                    $.each(sizeNames, function(index, sizeName) {
                        tableHtml += '<th style="text-align: center;">' + sizeName + '</th>';
                    });

                    tableHtml += '</tr>';
                    tableHtml += '</thead>';
                    tableHtml += '<tbody>';

                    $.each(response, function(index, item) {
                        var totalQtyOutput = 0;
                        var qtyOutputs = {};

                        $.each(item.cek, function(idx, cek) {
                            qtyOutputs[cek.size_name] = cek.qty_output;
                            totalQtyOutput += parseInt(cek.qty_output);
                        });

                        tableHtml += '<tr>';
                        tableHtml += '<td>' + item.nama + '</td>';

                        $.each(sizeNames, function(index, sizeName) {
                            if (qtyOutputs[sizeName]) {
                                tableHtml += '<td style="text-align: center;">' + qtyOutputs[sizeName] + '</td>';
                            } else {
                                tableHtml += '<td style="color: red; text-align: center;">0</td>';
                            }
                        });

                        tableHtml += '<td style="text-align: center;">' + totalQtyOutput + '</td>';
                        tableHtml += '<td>' + item.negara + '</td>';
                        tableHtml += '</tr>';
                    });

                    tableHtml += '</tbody>';
                    tableHtml += '</table>';
                    tableHtml += '</div>'; // Close table-responsive
                    tableHtml += '</div>'; // Close card-body
                    tableHtml += '</div>'; // Close card

                    $('#detailSewing').append(tableHtml);
                },
                error: function(xhr) {
                    alert('Terjadi kesalahan saat mengambil data sewing.');
                }
            });
        });
    </script>
  </body>
</html>