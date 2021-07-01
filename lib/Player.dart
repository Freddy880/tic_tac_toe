import 'package:flutter/material.dart';
import 'package:tic_tac_toe/GamePage.dart';

class Player {

  var _playerSym;
  var iD;

  Player(var pSym , int id){
    _playerSym = pSym;
    iD = id;
  }
 onTap(int index){
   if(xOrO[index] != "") {
     print("ERROR");
     return false;
   }
   xOrO[index] = _playerSym;
   if(iD == 1){
     xOrOC[index]=Colors.redAccent;
   }else{
     xOrOC[index]=Colors.black54;
   }
   return true;
 }

  /**
   * Kontrolliert, ob der Spieler gewonnen hat
   */
 win(){
    if(xOrO[0] == _playerSym && xOrO[1] == _playerSym && xOrO[2] == _playerSym){
      return true;
    }else if(xOrO[3] == _playerSym && xOrO[4] == _playerSym && xOrO[5] == _playerSym){
      return true;
    }if(xOrO[6] == _playerSym && xOrO[7] == _playerSym && xOrO[8] == _playerSym){
      return true;
    }else if(xOrO[0] == _playerSym && xOrO[4] == _playerSym && xOrO[8] == _playerSym){
      return true;
    }else if(xOrO[2] == _playerSym && xOrO[4] == _playerSym && xOrO[6] == _playerSym){
      return true;
    }else if(xOrO[0] == _playerSym && xOrO[3] == _playerSym && xOrO[6] == _playerSym){
      return true;
    }else if(xOrO[1] == _playerSym && xOrO[4] == _playerSym && xOrO[7] == _playerSym){
      return true;
    }else if(xOrO[2] == _playerSym && xOrO[5] == _playerSym && xOrO[8] == _playerSym){
      return true;
    }else{
      return false;
    }
 }
}