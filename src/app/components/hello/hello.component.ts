import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-hello',
  templateUrl: './hello.component.html',
  styleUrls: ['./hello.component.css']
})
export class HelloComponent implements OnInit {

  content : any;

  constructor(private http: HttpClient) { }

  ngOnInit(): void {

    let res = this.http.get("http://localhost:8080/getdetails",{responseType: 'text'});

    res.subscribe( data =>this.content =data)
  }

}
