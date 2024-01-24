import {Component, OnInit} from '@angular/core';
import {RouterOutlet} from '@angular/router';
import {HttpClient, HttpClientModule} from "@angular/common/http";
import {NgForOf} from "@angular/common";
import {FormsModule} from "@angular/forms";
import {log} from "@angular-devkit/build-angular/src/builders/ssr-dev-server";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HttpClientModule, NgForOf, FormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnInit{
  title = 'frontend';
  shops: any = [];

  searchModel: string = "";

  addresses: any = [];

  public constructor(private httpClient: HttpClient) {
  }

  public ngOnInit() {
    this.getShops();
  }

  public getAddresses() {
    console.log('response', this.searchModel);
    this.httpClient.get('http://localhost:8000/api/addresses', {
      params: {
        query: this.searchModel
      }
    }).subscribe((response:any) => {
      console.log(response);
      this.addresses = response['results'];
    }, (wat) => {
      console.log('wat', wat);
    });
  }

  public getShops() {
    this.httpClient.get('http://localhost:8000/api/test').subscribe((response) => {
      console.log('response', response);
      this.shops = response;
    }, (wat) => {
      console.log('wat', wat);
    });
  }
}
