package com.bank.notification_service.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.notification_service.entity.Notification;
import com.bank.notification_service.repository.NotificationRepository;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository repository;

    public Notification save(Notification notification) {
        return repository.save(notification);
    }

    public List<Notification> getAll() {
        return repository.findAll();
    }

    public Notification getById(Long id) {
        return repository.findById(id).orElse(null);
    }
}