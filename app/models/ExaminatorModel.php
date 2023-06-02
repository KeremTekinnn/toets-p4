<?php

class ExaminatorModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

public function getExaminator()
{
    $sql = "SELECT EXMNTR.Id
              ,CONCAT(EXMNTR.Voornaam, ' ', EXMNTR.Tussenvoegsel, ' ', EXMNTR.Achternaam) AS Fullname
              ,EX.Datum
              ,EX.Stad
              ,EX.Uitslag
              ,EX.Rijschool
              ,EX.RijbewijsCategorie
            FROM Examinator AS EXMNTR
            INNER JOIN ExamenPerExaminator AS EXPE ON EXPE.ExaminatorId = EXMNTR.Id
INNER JOIN Examen AS EX ON EXPE.ExamenId = EX.Id"
    ;
    $this->db->query($sql);
    return $this->db->resultSet();
}


}
