package com.bank.account_service.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bank.account_service.entity.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {
}