/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

public class Transaction {
    private int id;
    private String invoiceNumber;
    private String transactionCode;
    private String bank;
    private String paymentContent;
    private double amount;
    private LocalDateTime Dateofpayment;
    private String status;
    
    public Transaction() {
    }

    public Transaction(int id, String invoiceNumber, String transactionCode, String bank, String paymentContent, double amount, LocalDateTime Dateofpayment, String status) {
        this.id = id;
        this.invoiceNumber = invoiceNumber;
        this.transactionCode = transactionCode;
        this.bank = bank;
        this.paymentContent = paymentContent;
        this.amount = amount;
        this.Dateofpayment = Dateofpayment;
        this.status = status;
    }
     public Transaction( String invoiceNumber, String transactionCode, String bank, String paymentContent, double amount, LocalDateTime Dateofpayment, String status) {
        this.invoiceNumber = invoiceNumber;
        this.transactionCode = transactionCode;
        this.bank = bank;
        this.paymentContent = paymentContent;
        this.amount = amount;
        this.Dateofpayment = Dateofpayment;
        this.status = status;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public String getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(String transactionCode) {
        this.transactionCode = transactionCode;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getPaymentContent() {
        return paymentContent;
    }

    public void setPaymentContent(String paymentContent) {
        this.paymentContent = paymentContent;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getDateofpayment() {
        return Dateofpayment;
    }

    public void setDateofpayment(LocalDateTime Dateofpayment) {
        this.Dateofpayment = Dateofpayment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    

    
}
