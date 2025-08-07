package com.project.back_end.repo;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.back_end.models.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    
    @Query("SELECT p FROM Patient p WHERE p.email = :email")
    List<Patient> findAllByEmail(String email);
    
    @Query("SELECT p FROM Patient p WHERE p.email = :email ORDER BY p.id ASC LIMIT 1")
    Optional<Patient> findFirstByEmail(String email);
    
    // Keep the original method for backward compatibility but it may throw exception if duplicates exist
    Patient findByEmail(String email);

    Patient findByEmailOrPhone(String email, String phone);

}

