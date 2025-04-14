package company

import "logisticserver.com/config"

type Ship struct {
	SHIP_ID      int    `json:"id"`
	NAME         string `json:"name"`
	CAPTAIN_NAME string `json:"cap_name"`
	CRNT_LOC     string `json:"crnt_loc"`
	TO_LOC       string `json:"to"`
	FROM_LOC     string `json:"from"`
}

func GetShips() ([]Ship, error) {
	query := `SELECT P1.PORT_NAME AS CRNT,
					P2.PORT_NAME AS TO_LOC,
					P3.PORT_NAME AS FROM_LOC,
					E.NAME AS EMP_NAME,
					S.NAME,
					S.SHIP_ID
			FROM SHIP S
			JOIN PORT P1 ON S.CRNT_LOC=P1.PORT_ID
			JOIN PORT P2 ON S.TO_PORT =P2.PORT_ID
			JOIN PORT P3 ON S.FROM_PORT=P3.PORT_ID
			JOIN EMPLOYEE E ON S.CAPTAIN_ID = E.EMP_ID`

	var shipDetails []Ship

	ships, err := config.DB.Query(query)
	if err != nil {
		return nil, err
	}

	defer ships.Close()

	for ships.Next() {
		var ship Ship
		if err := ships.Scan(&ship.CRNT_LOC, &ship.TO_LOC, &ship.FROM_LOC, &ship.CAPTAIN_NAME, &ship.NAME, &ship.SHIP_ID); err != nil {
			return nil, err
		}
		shipDetails = append(shipDetails, ship)
	}
	return shipDetails, nil
}
