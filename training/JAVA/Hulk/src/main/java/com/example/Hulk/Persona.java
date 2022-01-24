package com.example.Hulk;

import javax.persistence.*;


@Entity
@Table(name = "personas")

public class Persona {
	
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String nombre;
	@Column
	private String apellido;
	
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	public void setName(String nombre) {
		this.nombre = nombre;
	}
	public String getName() {
		return nombre;
	}
	
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getApellido() {
		return apellido;
	}
	
	
	

}
