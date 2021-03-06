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

    Contact: freddy880.inbox@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/config.dart';

class Player {

  var _playerSym;
  String get playerSym => _playerSym;

  Color color1;
  Color color2;
  var iD;
  var lapsWon = 0;
  Player(var pSym , int id,Color color1, Color color2){
    _playerSym = pSym;
    iD = id;
    this.color1 = color1;
    this.color2 = color2;
  }

  //Wenn der Spieler drückt, wird getestet, ob er setzen kan
  //Wenn ja macht er es
 onTap(int index){
   if(xOrO[index] != "") {
     return false;
   }
   xOrO[index] = _playerSym;
   if(iD == 1){
     xOrOC[index]=color1;
   }else{
     xOrOC[index]=color2;
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
    if(lapsWon == lapsForWin){
      return true;
    }else{
    return false;
    }
 }
}