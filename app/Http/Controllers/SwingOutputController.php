<?php

namespace App\Http\Controllers;

use App\Models\Sewing;
use Illuminate\Http\Request;

class SwingOutputController extends Controller
{
    public function dataOutputSewing()
    {
        $sewing = Sewing::get();

        $data = $sewing->map(function ($item) {
            $item->tanggal = $item->trn_date;
            $item->style_code = $item->style_code;

            $item->total_size = Sewing::where('trn_date', $item->tanggal)->where('style_code', $item->style_code)->count();
            $item->total_output = Sewing::where('trn_date', $item->tanggal)->where('style_code', $item->style_code)->sum('qty_output');

            return $item;
        })->unique(function ($item) {
            return $item['tanggal'] . $item['style_code'];
        })->values();

        return datatables()->of($data)->make(true);
    }

    public function detailSewing($dataTanggal, $dataStyle)
    {
        $detailSewing = Sewing::where('trn_date', $dataTanggal)->where('style_code', $dataStyle)->get();

        $view = $detailSewing->map(function ($result) use ($dataTanggal, $dataStyle) {
            $result->nama = $result->operator_name;
            $result->negara = $result->destination->destination_name;

            $result->cek = Sewing::where('operator_name', $result->nama)
                ->where('destination_code', $result->destination_code)
                ->where('trn_date', $dataTanggal)
                ->where('style_code', $dataStyle)
                ->select('size_name', 'qty_output')->get();

            return $result;
        })->unique(function ($result) {
            return $result['destination_code'] . $result['operator_name'];
        })->values();

        // dd($view->toArray());

        return response()->json($view); // Mengembalikan response dalam bentuk JSON
    }
}
