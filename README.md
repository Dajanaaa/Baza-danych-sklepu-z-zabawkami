# Baza-danych-sklepu-z-zabawkami

 Zaprojektowana przeze mnie baza to model sklepu z zabawkami. Jej celem było zbieranie informacji na temat klientów, dostawców , produktów oraz prowadzonych transakcji. Model zawiera 6 tabel połączonych kluczami obcymi.
 
 W projekcie zostały stworzone funkcje takie jak : Losowanie_ilosci, Wybieranie_kliena, Wybieranie_produktu, które zostały wykorzystane w procedurze generowanie_transakcji. 

W bazie danych zaimplementowane są również triggery, które wykonują sie automatycznie po usunięciu rekordu w tabeli detale lub faktura oraz po utworzeniu rekordu w tabeli detale.

Stworzone perspektywy pozwaląja na dostęp do takich danych jak: wszytskie dostępne produkty, suma produktów od jednego dostawcy oraz suma wydatków poszeczególnych klientów.
 
