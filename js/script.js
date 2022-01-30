
const bt_calcula = document.querySelector('.calc_economia');
const economia = document.querySelector('.economia');
const ofertas = document.querySelector('.ofertas');

var bar_value = document.querySelector('.bar_value');
var range_value = document.querySelector('.range_value');
var pf = document.querySelector('.selector_pf');
var pj = document.querySelector('.selector_pj');





bar_value.addEventListener('click', () => {

  bar_value.value = currency_value.value*1000;
  bar_value.value += ',00';
  economia.disabled = false;
  economia.style.cursor = 'pointer';



})


// const contrata = document.querySelectorAll(".contrata")


const cooperativas = [

  {
   "nome":"EnergFácil",
   "valorMinimoMensal":1000,
   "valorMaximoMensal":40000,
   "desconto": 0.2,
   
  },

  {
   "nome":"EnerLimpa",
   "valorMinimoMensal":10000,
   "valorMaximoMensal":80000,
   "desconto": 0.25,
   
  },
  
  {
   "nome":"EnerGrande",
   "valorMinimoMensal":40000,
   "valorMaximoMensal":600000,
   "desconto": 0.3,
   
  },
  
  {
   "nome":"Voltz",
   "valorMinimoMensal":35000,
   "valorMaximoMensal":50000,
   "desconto": 0.4,
   
  },
  
  {
   "nome":"SolarMais",
   "valorMinimoMensal":45000,
   "valorMaximoMensal":81000,
   "desconto": 0.45,
   
  },
  
  {
   "nome":"StarkCorp",
   "valorMinimoMensal":90000,
   "valorMaximoMensal":100000,
   "desconto": 0.5,
   
  },
  




]

/* 

Teste objeto

var cooperTexto = {"nome":"EnergFácil","valorMinimoMensal":1000, "valorMaximoMensal":40000,"desconto": .2};

var cooper = JSON.parse(JSON.stringify(cooperTexto));

 document.getElementById("cooperativa").innerHTML = cooper.nome;
 */ 





 








function calculoEconomia(){





    
}






/* $("input[data-type='currency']").on({
    keyup: function() {
      formatCurrency($(this));
    },
    blur: function() { 
      formatCurrency($(this), "blur");
    }
});
 */

/* function formatNumber(n) {
  // format number 1000000 to 1,234,567
  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}


function formatCurrency(input, blur) {
  // appends $ to value, validates decimal side
  // and puts cursor back in right position.
  
  // get input value
  var input_val = input.val();
  
  // don't validate empty input
  if (input_val === "") { return; }
  
  // original length
  var original_len = input_val.length;

  // initial caret position 
  var caret_pos = input.prop("selectionStart");
    
  // check for decimal
  if (input_val.indexOf(".") >= 0) {

    // get position of first decimal
    // this prevents multiple decimals from
    // being entered
    var decimal_pos = input_val.indexOf(".");

    // split number by decimal point
    var left_side = input_val.substring(0, decimal_pos);
    var right_side = input_val.substring(decimal_pos);

    // add commas to left side of number
    left_side = formatNumber(left_side);

    // validate right side
    right_side = formatNumber(right_side);
    
    // On blur make sure 2 numbers after decimal
    if (blur === "blur") {
      right_side += "00";
    }
    
    // Limit decimal to only 2 digits
    right_side = right_side.substring(0, 2);

    // join number by .
    input_val = "$" + left_side + "." + right_side;

  } else {
    // no decimal entered
    // add commas to number
    // remove all non-digits
    input_val = formatNumber(input_val);
    input_val = "$" + input_val;
    
    // final formatting
    if (blur === "blur") {
      input_val += ".00";
    }
  }
  
  // send updated string to input
  input.val(input_val);

  // put caret back in the right position
  var updated_len = input_val.length;
  caret_pos = updated_len - original_len + caret_pos;
  input[0].setSelectionRange(caret_pos, caret_pos);
} */


