import 'dart:math';

class Schedina {
  var iColonne = 1;

  Schedina(this.iColonne);

  List<String> estrazioni({int iNumDaEstrarre = 1, int iRangeNumeri = 1}) {
    //ritorna n Array quante sono le colonne ognuno con le estrazioni
    final aEstrazioni = <String>[];

    for (int i = 0; i < iColonne; i++) {
      var estrazione = nuovaEstrazione(iNumDaEstrarre, iRangeNumeri);
      aEstrazioni.add(estrazione);
    }

    return aEstrazioni;
  }

  String nuovaEstrazione(int iNumDaEstrarre, int iRangeNumeri) {
    //ritorna una stringa con i iNumDaEstrarre mumeri estratti dal range specificato in iRangNumeri ordinati
    var listaEstratti = <int>[];
    const sep = "-";
    int i = 0;
    var rng = Random();
    int newNum;
    String ret = '';

    while (i < iNumDaEstrarre) {
      newNum = 1 + rng.nextInt(iRangeNumeri);
      if (!listaEstratti.contains(newNum)) {
        listaEstratti.add(newNum);
        i++;
      }
    }
    listaEstratti.sort();

    for (var element in listaEstratti) {
      ret = ret + element.toString().padLeft(2, '0') + sep;
    }

    //return listaEstratti.join(sep);

    return ret.substring(0, ret.length - 1);
  }
}

class SuperEnalotto extends Schedina {
  SuperEnalotto(super.iColonne);

  @override
  List<String> estrazioni({int iNumDaEstrarre = 6, int iRangeNumeri = 90}) {
    return super.estrazioni(iNumDaEstrarre: 6, iRangeNumeri: 90);
  }

  String getStar() {
    //ritorna il numero star
    return super.nuovaEstrazione(1, 90);
  }
}

class MilionDay extends Schedina {
  MilionDay(super.iColonne);

  @override
  List<String> estrazioni({int iNumDaEstrarre = 5, int iRangeNumeri = 55}) {
    return super.estrazioni(iNumDaEstrarre: 5, iRangeNumeri: 55);
  }
}

class EuroJackpot extends Schedina {
  EuroJackpot(super.iColonne);

  @override
  List<String> estrazioni({int iNumDaEstrarre = 5, int iRangeNumeri = 50}) {
    return super.estrazioni(iNumDaEstrarre: 5, iRangeNumeri: 50);
  }

  String get10() {
    //ritorna i due numeri 10
    return super.nuovaEstrazione(2, 10);
  }
}

class DieciLotto extends Schedina {
  DieciLotto(super.iColonne);

  @override
  List<String> estrazioni({int iNumDaEstrarre = 10, int iRangeNumeri = 90}) {
    return super.estrazioni(iNumDaEstrarre: 10, iRangeNumeri: 90);
  }
}
