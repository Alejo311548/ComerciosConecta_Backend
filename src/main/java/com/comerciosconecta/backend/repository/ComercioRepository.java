package com.comerciosconecta.backend.repository;



import com.comerciosconecta.backend.entity.Comercio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComercioRepository extends JpaRepository<Comercio, Long> {

    // Ejemplo: buscar comercio por email
    Comercio findByEmail(String email);

    // Ejemplo: verificar si existe por NIT
    boolean existsByNit(String nit);
}

