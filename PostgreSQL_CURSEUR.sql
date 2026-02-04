DO $$
DECLARE
    -- Déclaration du curseur
    cur_articles_2025 CURSOR FOR
        SELECT
            a.id_article,
            a.nom_article,
            v.date_vente,
            lv.quantite,
            lv.prix_unitaire,
            (lv.quantite * lv.prix_unitaire) AS montant_total
        FROM ventes v
        JOIN ligne_vente lv ON v.id_vente = lv.id_vente
        JOIN articles a ON a.id_article = lv.id_article
        WHERE EXTRACT(YEAR FROM v.date_vente) = 2025
        ORDER BY v.date_vente;

    -- Variables pour récupérer les données
    v_id_article     INT;
    v_nom_article    TEXT;
    v_date_vente     DATE;
    v_quantite       INT;
    v_prix           NUMERIC;
    v_montant        NUMERIC;
BEGIN
    OPEN cur_articles_2025;

    LOOP
        FETCH cur_articles_2025
        INTO v_id_article, v_nom_article, v_date_vente, v_quantite, v_prix, v_montant;

        EXIT WHEN NOT FOUND;

        RAISE NOTICE
            'Date: %, Article: %, Quantité: %, Prix: %, Total: %',
            v_date_vente,
            v_nom_article,
            v_quantite,
            v_prix,
            v_montant;
    END LOOP;

    CLOSE cur_articles_2025;
END $$;

