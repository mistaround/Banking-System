close all;
clear all;
db = BankDB;
%由于mac的xls格式不支持Matlab读写，所以被迫使用csv格式
db.accountdata = fopen('AccountData.csv','a+');
%db.tradingdata = fopen('TradingData.csv','a+');
db.addr = 'AccountData.csv';
%db.addrt = 'TradingData.csv';

ticket = Ticket;
ticket.order = 1;

CuApp = CustomUI;
CaApp = CashierUI;
ATM = ATMUI;

CuApp.Ticket = ticket;
CuApp.Cashier = CaApp;
CuApp.DB = db;
CaApp.DB = db;
ATM.DB = db;

