DO $$
DECLARE
    cur_resume CURSOR FOR
        SELECT
            a.nom_article,
            SUM(lv.quantite) AS total_quantite,
            SUM(lv.quantite * lv.prix_unitaire) AS chiffre_affaires
        FROM ventes v
        JOIN ligne_vente lv ON v.id_vente = lv.id_vente
        JOIN articles a ON a.id_article = lv.id_article
        WHERE EXTRACT(YEAR FROM v.date_vente) = 2025
        GROUP BY a.nom_article
        ORDER BY chiffre_affaires DESC;

    v_article TEXT;
    v_qte     INT;
    v_ca      NUMERIC;
BEGIN
    OPEN cur_resume;

    LOOP
        FETCH cur_resume INTO v_article, v_qte, v_ca;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE
            'Article: %, Quantité totale: %, CA: %',
            v_article, v_qte, v_ca;
    END LOOP;

    CLOSE cur_resume;
END $$;

