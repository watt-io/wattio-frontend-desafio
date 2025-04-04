import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent {
  title = 'hello-angular';
  nenhumaEncontrada : boolean = false;
  buscou: boolean = false;
  gastoMensal: any;
  corpResposta :any;
  corporativas = [
    {
      nome : 'EnerFácil',
      valorMinimoMensal : 1000,
      valorMaximoMensal : 40000,
      desconto : .2,
      },
      {
      nome : 'EnerLimpa',
      valorMinimoMensal : 10000,
      valorMaximoMensal: 80000,
      desconto: .25,
      },
      {
      nome: 'EnerGrande',
      valorMinimoMensal: 40000,
      valorMaximoMensal: 100000,
      desconto: .3,
      },
      {
        nome: 'EnerExtra',
        valorMinimoMensal: 40000,
        valorMaximoMensal: 90000,
        desconto: .27,
        }
  ]
  
  
  encontraCorporativa(valor: String){
    valor = valor.slice(2).replaceAll(/\./gi, '')
    this.gastoMensal = Number(valor)
    this.corpResposta = []
    for(let i=0; i<this.corporativas.length; i++){
     if(this.corporativas[i].valorMaximoMensal >= this.gastoMensal && this.gastoMensal >= this.corporativas[i].valorMinimoMensal){
      this.corpResposta.push(this.corporativas[i]);
     }
    }
    if(this.corpResposta.length == 0){
      this.nenhumaEncontrada = true;
      this.buscou = false;
    }else{
      this.nenhumaEncontrada = false;
      this.buscou = true;
    }
  }
  escolhe(event: any){
    var element = document.getElementById(event) as HTMLInputElement;
    element.checked = true;
  }
  mudaValor(event : any){
    var valor = document.getElementById("valor") as HTMLInputElement
    if(event.key == "Enter"){
      this.encontraCorporativa(valor.value)
    }
  }
}


