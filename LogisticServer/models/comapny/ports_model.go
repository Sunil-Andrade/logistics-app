package company

import (
	"fmt"

	"logisticserver.com/config"
)

type Port struct {
	PortId   int    `json:"id"`
	Name     string `json:"name"`
	Location string `json:"location"`
	Capacity int    `json:"capacity"`
}

func GetPorts() ([]Port, error) {
	query := "SELECT PORT_ID, PORT_NAME,LOCATION,CAPACITY FROM PORT"

	var portDetails []Port
	ports, err := config.DB.Query(query)
	if err != nil {
		return nil, fmt.Errorf("error executing query: %w", err) // More descriptive error
	}
	defer ports.Close() // Ensure closure after successful query execution

	for ports.Next() {
		var port Port
		if err := ports.Scan(&port.PortId, &port.Name, &port.Location, &port.Capacity); err != nil {
			return nil, fmt.Errorf("error scanning row: %w", err) // Improved error message
		}
		portDetails = append(portDetails, port)
	}

	if err := ports.Err(); err != nil { // Check for errors during iteration
		return nil, fmt.Errorf("error iterating over results: %w", err)
	}

	return portDetails, nil
}
