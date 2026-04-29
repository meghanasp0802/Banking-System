package com.bank.account_service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.account_service.entity.Account;
import com.bank.account_service.repository.AccountRepository;

@Service
public class AccountService {

    @Autowired
    private AccountRepository repository;

    public Account createAccount(Account account) {
        return repository.save(account);
    }

    public List<Account> getAllAccounts() {
        return repository.findAll();
    }

    public Account getAccountById(Long id) {
        return repository.findById(id).orElse(null);
    }
}