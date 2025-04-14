package consumer

import "logisticserver.com/config"

type Order struct {
	ID      int    `json:"id,omitempty"`
	NAME    string `json:"name"`
	FROM    int    `json:"from"`
	TO      int    `json:"to"`
	Ship    int    `json:"ship"`
	USER_ID int    `json:"user_Id"`
	DEL     bool   `json:"del"`
}

type OrderDetail struct {
	ID        int    `json:"id,omitempty"`
	NAME      string `json:"name"`
	FROM_PORT string `json:"from"`
	TO_PORT   string `json:"to"`
	USER_ID   int    `json:"user_Id"`
	DEL       bool   `json:"del"`
}

func PlaceOrder(order *Order) error {
	query := "INSERT INTO CARGO (FROM_ID,TO_ID,USER_ID,NAME,IS_DEL) VALUES (?,?,?,?,?)"
	print(order.FROM, order.TO)
	_, err := config.DB.Exec(query, order.FROM, order.TO, order.USER_ID, order.NAME, order.DEL)
	if err != nil {
		return err
	}
	return nil
}

func GetOrder(id int) ([]OrderDetail, error) {
	query := `SELECT p1.PORT_NAME AS FROM_PORT,
					 p2.PORT_NAME AS TO_PORT,
					 c.CARG_ID,
					 c.NAME,
					 c.IS_DEL,
					 c.USER_ID
			 FROM CARGO c
			 JOIN PORT p1 ON c.FROM_ID = p1.PORT_ID
			 JOIN PORT p2 ON c.TO_ID = p2.PORT_ID
			 WHERE USER_ID = ?`

	var orders []OrderDetail
	rows, err := config.DB.Query(query, id)
	if err != nil {

		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var order OrderDetail
		if err := rows.Scan(&order.FROM_PORT, &order.TO_PORT, &order.ID, &order.NAME, &order.DEL, &order.USER_ID); err != nil {
			return nil, err
		}
		orders = append(orders, order)
	}
	return orders, nil
}

func UpdateShip(order *Order) error {
	query := "UPDATE CARGO SET SHIP_ID = ? WHERE CARG_ID = ?"

	_, err := config.DB.Exec(query, order.Ship, order.ID)
	if err != nil {
		return err
	}

	return nil
}
