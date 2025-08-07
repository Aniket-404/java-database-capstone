package com.project.back_end.repo;

import com.project.back_end.models.Doctor;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Long> {
   
   @Query("SELECT d FROM Doctor d WHERE d.email = :email")
   List<Doctor> findAllByEmail(String email);
   
   @Query("SELECT d FROM Doctor d WHERE d.email = :email ORDER BY d.id ASC LIMIT 1")
   Optional<Doctor> findFirstByEmail(String email);
   
   // Keep the original method for backward compatibility but it may throw exception if duplicates exist
   Doctor findByEmail(String email);

   @Query("SELECT d FROM Doctor d WHERE d.name LIKE CONCAT('%', :name, '%')")
   List<Doctor> findByNameLike(String name);

   @Query("SELECT d FROM Doctor d WHERE LOWER(d.name) LIKE LOWER(CONCAT('%', :name, '%')) AND LOWER(d.specialty) = LOWER(:specialty)")
   List<Doctor> findByNameContainingIgnoreCaseAndSpecialtyIgnoreCase(String name, String specialty);

   List<Doctor> findBySpecialtyIgnoreCase(String specialty);
}