package com.bank.transaction_service.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bank.transaction_service.entity.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {
}