interface class Subject;
    pure virtual function void registerObserver(Observer o);
    pure virtual function void removeObserver(Observer o);
    pure virtual function void notifyObservers();
endclass // Subject
