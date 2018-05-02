DROP TABLE detale CASCADE CONSTRAINTS; DROP TABLE dostawca CASCADE CONSTRAINTS; DROP TABLE faktura CASCADE CONSTRAINTS; DROP TABLE klient CASCADE CONSTRAINTS; DROP TABLE produkt CASCADE CONSTRAINTS; DROP TABLE rodzaj CASCADE CONSTRAINTS;
CREATE TABLE detale (    id_faktury       NUMBER(5) NOT NULL,    pozycja          NUMBER(5) NOT NULL,    cena_sprzedarzy   NUMBER(5,2) NOT NULL,    ilosc            NUMBER(5) NOT NULL,    id_produktu      NUMBER(5) NOT NULL );
ALTER TABLE detale ADD CONSTRAINT detale_pk PRIMARY KEY ( pozycja,id_faktury );
CREATE TABLE dostawca (    id_dostawcy   NUMBER(5) NOT NULL,    nazwa_firmy   VARCHAR2(40) NOT NULL,    adres         VARCHAR2(40),    nip           NUMBER(9) NOT NULL );
ALTER TABLE dostawca ADD CONSTRAINT dostawca_pk PRIMARY KEY ( id_dostawcy );
CREATE TABLE faktura (    id_faktury         NUMBER(5) NOT NULL,    data_wystawienia   DATE NOT NULL,    wartosc_faktury    NUMBER(10,2) NOT NULL,    id_klienta         NUMBER(5) NOT NULL );
ALTER TABLE faktura ADD CONSTRAINT faktura_pk PRIMARY KEY ( id_faktury );
CREATE TABLE klient (    id_klienta       NUMBER(5) NOT NULL,    imie             VARCHAR2(50) NOT NULL,    nazwisko         VARCHAR2(50) NOT NULL,    adres            VARCHAR2(50),    numer_telefonu   NUMBER(10) );
ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( id_klienta );
CREATE TABLE produkt (    id_produktu         NUMBER(5) NOT NULL,    nazwa               VARCHAR2(50) NOT NULL,    cena                NUMBER(5,2) NOT NULL,    id_rodzaju          NUMBER(5) NOT NULL,    id_dostawcy         NUMBER(5) NOT NULL,    ilosc_w_magazynie   NUMBER(5) NOT NULL );
ALTER TABLE produkt ADD CONSTRAINT produkt_pk PRIMARY KEY ( id_produktu );
CREATE TABLE rodzaj (    id_rodzaju      NUMBER(5) NOT NULL,    nazwa_rodzaju   VARCHAR2(40) NOT NULL,    przeznaczenie   VARCHAR2(40) NOT NULL );
ALTER TABLE rodzaj ADD CONSTRAINT rodzaj_pk PRIMARY KEY ( id_rodzaju );
ALTER TABLE produkt ADD CONSTRAINT dostawca_fk FOREIGN KEY ( id_dostawcy )    REFERENCES dostawca ( id_dostawcy );
ALTER TABLE detale ADD CONSTRAINT faktura_fk FOREIGN KEY ( id_faktury )    REFERENCES faktura ( id_faktury );
ALTER TABLE faktura ADD CONSTRAINT klient_fk FOREIGN KEY ( id_klienta )    REFERENCES klient ( id_klienta );
ALTER TABLE detale ADD CONSTRAINT produkt_fk FOREIGN KEY ( id_produktu )    REFERENCES produkt ( id_produktu );
ALTER TABLE produkt ADD CONSTRAINT rodzaj_fk FOREIGN KEY ( id_rodzaju )    REFERENCES rodzaj ( id_rodzaju );
--Wprowadzanie danych: insert into KLIENT values ( 1, 'Dominik' ,'Derski', 'ul.Mickiewcza 2', 145741823); insert into KLIENT values ( 2, 'Daria' ,'Chmielewska', 'ul.Rodla 8', 963874123); insert into KLIENT values ( 3, 'Kasia' ,'Tkaczyk', 'ul.Pirenejska 55', 456594123); insert into KLIENT values ( 4, 'Tomek' ,'Gliwicki', 'ul.Obozowa 63', 693974123); insert into KLIENT values ( 5, 'Ola' ,'Tkaczyk', 'ul.Polna 10', 785541456); insert into KLIENT values ( 6, 'Karol' ,'Dusza', 'ul.Utrata 25', 515974123); insert into KLIENT values ( 7, 'Kuba' ,'Dobosz', 'ul.Mickiewcza 85', 123974123); insert into KLIENT values ( 8, 'Ewa' ,'Abacka', 'ul.Górczewska 1', 78597123); insert into KLIENT values ( 9, 'Mateusz' ,'Panasiuk', 'ul.Chrobrego 2', 515995613); insert into KLIENT values ( 10, 'Magda' ,'Derska', 'ul.Mila 18',45896123); insert into KLIENT values ( 11, 'Tomek' ,'Ganko', 'ul.Rodla 5',515158789); insert into KLIENT values ( 12, 'Diana' ,'Abacka', 'ul.Domanska 5',963852741); insert into KLIENT values ( 13, 'Pawel' ,'Imko', 'ul.Murarska 4',187411253); insert into KLIENT values ( 14, 'Iza' ,'Miko', 'ul.Mloda 125',145691223);
insert into KLIENT values ( 15, 'Piotr' ,'Kacprzyk', 'ul.Goralska 18',555961231);
insert into DOSTAWCA values ( 1 , 'Sidba', 'Warszawa ul.Plocla 5' , 968549650); insert into DOSTAWCA values ( 2 , 'RGH', '£odz  ul.Szpitalna 25' , 125789654); insert into DOSTAWCA values ( 3 , 'Wader', 'Bialystok ul.Towarowa 14' , 456789123); insert into DOSTAWCA values ( 4 , 'Alexis', 'Bialystok ul.Handlowa 6' , 145698723); insert into DOSTAWCA values ( 5 , 'Inter', 'Warszawa ul.Góralsa 14' , 474569632);
insert into RODZAJ values ( 1 , 'Lalka', 'Zabawka dla dziewczynki'); insert into RODZAJ values ( 2 , 'Grzechotka', 'Zabawka dla niemowlaka'); insert into  RODZAJ values ( 3 , 'Samochód', 'Zabawka dla chlopca'); insert into  RODZAJ values ( 4 , 'Mis', 'Zabawka dla dziewczynki'); insert into  RODZAJ values ( 5 , 'Samolot', 'Zabawka dla chlopca'); insert into  RODZAJ values ( 6 , 'Karuzelka', 'Zabawka dla niemowlaka');
insert into PRODUKT values ( 1, 'Wywrotka', 53 , 3, 1, 100); insert into PRODUKT values ( 2, 'Lalka z dlugimi wlosami',25,  1, 3, 150); insert into PRODUKT values ( 3 , 'Grzechotka - klucze ',15, 2 , 1, 50); insert into PRODUKT values ( 4 , 'Gryzak',18, 2 , 5, 80); insert into PRODUKT values ( 5 , 'Lalka grajaca',55, 1 , 4,90); insert into PRODUKT values ( 6 , 'Barbie',85, 1, 1, 100); insert into PRODUKT values ( 7 , 'Piesek ',15, 4,1, 30); insert into PRODUKT values ( 8 , 'Samolot sterowany',115, 5, 4 , 10); insert into PRODUKT values ( 9 , 'Karuzelka z pluszakami',95, 6,2 , 30); insert into PRODUKT values ( 10 , 'Kotek',25, 4 , 2, 50);
CREATE SEQUENCE SEG_ID_FAKTURY INCREMENT BY 1 START WITH 1 NOCACHE; --Tworzenie funkcji:
create or replace FUNCTION LOSOWANIE_ILOSCI (v_min IN integer, v_max IN integer) RETURN INTEGER IS WYNIK INTEGER; BEGIN
wynik := Round(dbms_random.value(v_min, v_max));
return wynik; end losowanie_ilosci; / create or replace function Wybieranie_klienta RETURN INTEGER IS WYNIK INTEGER; v_min INTEGER; v_max INTEGER ; BEGIN SELECT MIN(ID_KLIENTA) INTO v_min from KLIENT; SELECT MAX(ID_KLIENTA) INTO v_max from KLIENT;
wynik := Round(dbms_random.value(v_min, v_max));
return wynik; end Wybieranie_klienta;
/
create or replace function Wybieranie_produktu RETURN INTEGER IS WYNIK INTEGER; v_min INTEGER; v_max INTEGER ; BEGIN SELECT MIN(ID_PRODUKTU) INTO v_min from PRODUKT; SELECT MAX(ID_PRODUKTU) INTO v_max from PRODUKT;
wynik := Round(dbms_random.value(v_min, v_max));
return wynik; end Wybieranie_produktu;
/
create or replace function dostawa (v_produkt IN NUMBER , v_ilosc IN NUMBER) RETURN boolean IS ZMIENNA NUMBER; BEGIN
select id_produktu into zmienna from produkt where produkt.id_produktu=v_produkt;
update produkt set ilosc_w_magazynie =ilosc_w_magazynie + v_ilosc;
return true; end; / --Tworzenie procedur create or replace procedure pr_wstaw_klienta (p_id_klienta IN NUMBER, p_imie IN VARCHAR2, p_nazwisko IN VARCHAR2, p_adres IN VARCHAR2, p_numer_telefonu NUMERIC ) IS BEGIN INSERT INTO KLIENT( ID_KLIENTA , IMIE, NAZWISKO, ADRES, NUMER_TELEFONU) VALUES( p_id_klienta,p_imie,p_nazwisko,p_adres,p_numer_telefonu); END pr_wstaw_klienta; /
--Generator create or replace procedure generowanie_transakcji as
poz number; zmienna numeric; klient1 NUMERIC ; produkt1 NUMERIC; cena1 NUMERIC; ilosc1  NUMERIC ; i  NUMber; j NUMERIC; suma NUMERIC; w NUMber;
begin klient1 := Wybieranie_klienta;
insert into faktura(id_faktury, data_wystawienia, wartosc_faktury,id_klienta) values (seg_ID_FAKTURY.nextval , sysdate, 0 , klient1);
w:= seg_ID_FAKTURY.currval;
i := 1; j := losowanie_ilosci(1, 10); poz:=0;
loop
ilosc1 := losowanie_ilosci(1,5); produkt1 := Wybieranie_produktu();
select count(id_produktu) into zmienna from DETALE where id_faktury=w and id_produktu=produkt1;
select cena into cena1 from Produkt where Produkt.id_produktu=produkt1;
if zmienna = 0
then i := i+1; poz :=poz +1;
insert into detale(id_faktury, cena_SPRZEDARZY, ilosc, pozycja, id_produktu) values(w, cena1, ilosc1,poz ,produkt1);
suma:=(ilosc1*cena1);
UPDATE FAKTURA 
SET WARTOSC_FAKTURY = WARTOSC_FAKTURY+ suma where Faktura.id_faktury = w;
end if; EXIT WHEN i > j ;
end loop;
end;
/
BEGIN    DBMS_SCHEDULER.CREATE_SCHEDULE (               repeat_interval  => 'FREQ=HOURLY;INTERVAL=12;BYDAY=MON,TUE,WED,THU,FRI,SAT,SUN',             start_date =>SYSDATE,        schedule_name  => '"INTERVAL_EVERY_12HOUR"');        END;
/ BEGIN    DBMS_SCHEDULER.create_program(        program_name => 'K5X3_08.GENERATO_PROGRAM',        program_type => 'STORED_PROCEDURE',        program_action => 'GENEROWANIE_TRANSAKCJI' ,                comments => NULL,        enabled => TRUE        );  END;
/ BEGIN    DBMS_SCHEDULER.CREATE_JOB (            job_name => 'GENEROWANIE_DANYCH',            program_name => 'GENERATO_PROGRAM',            schedule_name=>'INTERVAL_EVERY_12HOUR',            enabled=>TRUE,            comments => NULL            ); END;                 /      begin      dbms_scheduler.run_job('GENEROWANIE_DANYCH');      end;  
/
--Triggery: create or replace TRIGGER "TR_D_DETALE" after delete on detale for each row begin update produkt set ILOSC_W_MAGAZYNIE= ILOSC_W_MAGAZYNIE+:old.ilosc where :old.id_produktu = Produkt.Id_produktu ; end;
/ create or replace TRIGGER "TR_D_FAKTURA" before delete on faktura for each row begin delete detale where :old.id_faktury = detale.id_faktury; end;
/ create or replace TRIGGER "TR_IN_DETALE" after insert on detale for each row begin update produkt set ILOSC_W_MAGAZYNIE= ILOSC_W_MAGAZYNIE- :new.ilosc where :new.id_produktu = Produkt.Id_produktu ; end;
--Perspektywy: / CREATE OR REPLACE VIEW DOSTEPNE_PRODUKTY AS   SELECT P.ID_PRODUKTU, P.NAZWA, P.CENA, P.ILOSC_W_MAGAZYNIE, R.NAZWA_RODZAJU, R.PRZEZNACZENIE, D.NAZWA_FIRMY DOSTAWCA FROM Dostawca D , Produkt P , RODZAJ R WHERE P.ID_RODZAJU= R.ID_RODZAJU AND P.ID_DOSTAWCY=D.ID_DOSTAWCY order by P.ID_PRODUKTU;
/ CREATE OR REPLACE VIEW suma_od_dostawcy AS SELECT  D.id_dostawcy, D.nazwa_firmy , D.ADRES, D.NIP ,SUM(P.ILOSC_W_MAGAZYNIE) SUMA FROM Dostawca D JOIN Produkt P ON D.ID_DOSTAWCY=P.ID_DOSTAWCY GROUP BY D.ID_DOSTAWCY, D.NAZWA_FIRMY, D.ADRES, D.NIP order by D.ID_DOSTAWCY; / CREATE OR REPLACE  VIEW Suma_wydatkow_klienta AS   SELECT  K.Id_klienta, k.NAZWISKO, k.IMIE ,SUM(F.WARTOSC_faktury) Kwota_wydatow FROM FAKTURA F JOIN KLIENT K ON F.ID_KLIENTA=K.ID_KLIENTA GROUP BY K.ID_KLIENTA, k.NAZWISKO , K.IMIE order by ID_KLIENTA;