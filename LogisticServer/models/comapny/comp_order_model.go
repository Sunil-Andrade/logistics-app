package company

import "logisticserver.com/config"

type OrderDetail struct {
	ID        int    `json:"id,omitempty"`
	NAME      string `json:"name"`
	FROM_PORT string `json:"from"`
	TO_PORT   string `json:"to"`
	USER_ID   int    `json:"user_Id"`
	DEL       bool   `json:"del"`
}

func CGetOrder() ([]OrderDetail, error) {
	query := `SELECT p1.PORT_NAME AS FROM_PORT,
					 p2.PORT_NAME AS TO_PORT,
					 c.CARG_ID,
					 c.NAME,
					 c.IS_DEL,
					 c.USER_ID
			 FROM CARGO c
			 JOIN PORT p1 ON c.FROM_ID = p1.PORT_ID
			 JOIN PORT p2 ON c.TO_ID = p2.PORT_ID`

	var orders []OrderDetail
	rows, err := config.DB.Query(query)
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
