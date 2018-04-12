package edu.iot.butter.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sensor implements Serializable {
	private long id;
	private String type;
	private String name;
	private int pinNumber;
	private double value;
	private Date time;
	
}
