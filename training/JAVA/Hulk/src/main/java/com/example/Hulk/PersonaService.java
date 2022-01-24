package com.example.Hulk;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface PersonaService {

	
	List<Persona>listar();
	Persona listarId(int id);
	Persona add(Persona p);
	Persona edit(Persona p);
	Persona delete(int id);
	
	
}
