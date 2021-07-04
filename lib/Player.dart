/*
    Copyright (C) 2021  Florian Marks

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    Contact: marks.florian123@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/GamePage.dart';

class Player {

  var _playerSym;
  var iD;
  var _lapsWon = 0;
  set lapsWon (int value){
    _lapsWon = value;
  }
  int get lapsWon => _lapsWon;

  Player(var pSym , int id){
    _playerSym = pSym;
    iD = id;
  }

  //Wenn der Spieler drückt, wird getetst, ob er setzen kan
  //Wenn ja macht er es
 onTap(int index){
   if(xOrO[index] != "") {
     print("ERROR");
     return false;
   }
   xOrO[index] = _playerSym;
   if(iD == 1){
     xOrOC[index]=Color(0xF01937F8);
   }else{
     xOrOC[index]=Colors.black54;
   }
   return true;
 }

  // Kontrolliert, ob der Spieler eine Runde gewonnen hat
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
 winGame(){
    if(_lapsWon == 11){
      return true;
    }else{
    return false;
    }
 }
}