//  This file is part of gplix, https://github.com/devosoft/gplix
//  Copyright (C) Michigan State University, 2017.
//  Released under the MIT Software license; see doc/LICENSE

#include "web/web.h"

namespace UI = emp::web;

UI::Document doc("emp_base");
int x = 5; 

void incX(){ x++; doc.Redraw();} 


int main()
{

  doc << "<h1>Hello, world!</h1>";
  doc << x << " <br>"; 
  doc << UI::Live(x) << "<br>" ; 

  UI::Table table(12,12); 



  for (int i=0; i<12; i++){
      table.GetCell(i,i) <<"hi";
  }

  UI::Button button(incX, "inc x"); 
  doc << button; 

  table.GetCell(3,5) << "hello world again"; 
  table.GetCell(9,6) << "hello world again"; 

  table.GetTable(); 
  table.SetCSS("border","1px solid green"); 


  doc << table; 

  UI::Image train("train.png"); 

  doc << train; 


}
