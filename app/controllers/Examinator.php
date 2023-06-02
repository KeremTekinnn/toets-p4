<?php

class Examinator extends BaseController
{
    private $examinatorModel;

    public function __construct()
    {
        $this->examinatorModel = $this->model('ExaminatorModel');
    }

    public function overzichtExaminator()
    {
        $result = $this->examinatorModel->getExaminator();

        var_dump($result);
        $rows = "";
        foreach ($result as $examinator) {
            $date = date_create($examinator->Datum);
            $formatted_date = date_format($date, 'd-m-Y');

            $rows .= "<tr>
                        <td>$examinator->Fullname</td>
                        <td>$formatted_date</td>
                        <td>$examinator->RijbewijsCategorie</td>            
                        <td>$examinator->Rijschool</td>
                        <td>$examinator->Stad</td>
                        <td>$examinator->Uitslag</td>                 
                      </tr>";
        }

        $data = [
            'title' => 'Overzicht Afgenomen Examens Examinatoren',
            'rows' => $rows
        ];

        $this->view('Examinator/overzichtExaminator', $data);
    }

}
