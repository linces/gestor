/*
encr.h
------
Begin: 2007/03/12
Last revision: $Date: 2007-03-26 05:05:44 $ $Author: areeves $
Version: $Revision: 1.2 $
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Contents of this file are based on and adapted from code written for the Atriplex Distributed 
Computing System by Aaron Reeves, and released under the terms of the GNU General Public License.

Original code Copyright (C) 2003 - 2007 Aaron Reeves
Modifications Copyright (C) 2007 Animal Population Health Institute, Colorado State University 
*/


#include "stdafx.h"

#include "encr.h"

#include "debug.h"
#include "stringhandling.h"

// rc4 encryption function based on code written by Joseph Gama
// See http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeID=4653&lngWId=3
void rc4( char* ByteInput, char* pwd, char* &ByteOutput ){
  char* temp;
  int i,j=0,t,tmp,tmp2,s[256], k[256];
  for (tmp=0;tmp<256;tmp++){
    s[tmp]=tmp;
    k[tmp]=pwd[(tmp % strlen((char *)pwd))];
  }
  for (i=0;i<256;i++){
    j = (j + s[i] + k[i]) % 256;
    tmp=s[i];
    s[i]=s[j];
    s[j]=tmp;
  }

  temp = new char [ (int)strlen((char *)ByteInput)  + 1 ] ;
  i=j=0;
  for (tmp=0;tmp<(int)strlen((char *)ByteInput);tmp++){
    i = (i + 1) % 256;
    j = (j + s[i]) % 256;
    tmp2=s[i];
    s[i]=s[j];
    s[j]=tmp2;
    t = (s[i] + s[j]) % 256;
    if (s[t]==ByteInput[tmp]) {
      temp[tmp]=ByteInput[tmp];
    }
    else {
      temp[tmp]=s[t]^ByteInput[tmp];
    }
  }
  temp[tmp]='\0';
  ByteOutput=temp;
}


int intFromHex(char hc, char lc ) {
  int Hi;        // holds high byte
  int Lo;        // holds low byte
  int Result;    // holds result

  // Get the value of the first byte to Hi

  Hi = hc;
  if ('0' <= Hi && Hi <= '9') {
      Hi -= '0';
  } else
  if ('a' <= Hi && Hi <= 'f') {
      Hi -= ('a'-10);
  } else
  if ('A' <= Hi && Hi <= 'F') {
      Hi -= ('A'-10);
  }

  // Get the value of the second byte to Lo

  Lo = lc;
  if ('0' <= Lo && Lo <= '9') {
      Lo -= '0';
  } else
  if ('a' <= Lo && Lo <= 'f') {
      Lo -= ('a'-10);
  } else
  if ('A' <= Lo && Lo <= 'F') {
      Lo -= ('A'-10);
  }
  Result = Lo + (16 * Hi);
  return (Result);
}



DLL_API char* rc4Encrypt( char* str, char* password ) {
  char* result;
  rc4( str, password, result );
  //set_string( result ); // to be freed, eventually.
  return result;
}


DLL_API char* hexEncode( char* str ) {
  unsigned int i;
  unsigned char c;
  char code[3];
  char* result;

  result = new char[ 2 * strlen( str ) + 1 ]; // The hex version will have two characters for every one character in str.
  memset( result, 0, strlen(result) );

  for( i = 0; i < strlen( str ); ++i ) {
    c = str[i];

    if( c < 16 ) {
      sprintf( code, "0%X", c );
    }
    else {
      sprintf( code, "%X", c );
    }

    sprintf( result, "%s%s", result, code );
  }

  //set_string( result ); // to be freed, eventually.
  return result;
}



DLL_API char* hexDecode( char* str ) {
  unsigned int i, j;
  char hc, lc;
  int c;
  char* result;

  result = new char[ strlen(str) +1 ]; // This is actually more than enough
  memset( result, 0, strlen(result) );

  j = 0;
  for( i = 0; i < strlen( str ); i = i + 2 ) {
    hc = str[i];
    lc = str[i + 1];
    c = intFromHex( hc, lc );
    result[j] = (char)c;
    ++j;
  }

  //set_string( result ); // to be freed, eventually.
  return result;
}



