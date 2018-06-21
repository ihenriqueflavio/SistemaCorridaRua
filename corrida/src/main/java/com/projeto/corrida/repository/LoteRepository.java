package com.projeto.corrida.repository;

import com.projeto.corrida.model.Lote;
import com.projeto.corrida.model.Percurso;
import org.springframework.data.repository.CrudRepository;

public interface LoteRepository extends CrudRepository<Lote, Long> {
}
