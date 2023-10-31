---
layout: post
title: Angular Section 5,6,7,8. Components, Databinding, Advanced Directives
date: 2023-10-30 12:25 -0500
categories: [Angular, Udemy]
image: 
  path: /2023-10-30-angular-section-5-6-7-8-components-databinding-advanced-directives/profile.png
---

- [Passing data between different components](#passing-data-between-different-components)
- [@Input Decorator](#input-decorator)
- [Emitting events with @Output](#emitting-events-with-output)
- [View encapsulation](#view-encapsulation)
- [Using local references in templates](#using-local-references-in-templates)
- [Accessing Local references through the DOM with @ViewChild](#accessing-local-references-through-the-dom-with-viewchild)
- [Projecting content into component with ng-content](#projecting-content-into-component-with-ng-content)
- [Component lifecycle](#component-lifecycle)


# Passing data between different components
  - we want to pass data between different components but don't know how to do up to this point

# @Input Decorator 
  - @Input is a decorator in Angular used to declare an input property in a component. Input properties allow data to be passed into a component from its parent component. This is a fundamental concept in Angular, and it enables parent-child communication within your application.
  - we can use property and event binding on html elements and their native properties and events
  - we can use property binding on **directives** 
  - we can also property binding on our custom components properties and events

```typescript
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  serverElements = [ {type: 'server', name: 'testsever', content: 'just a test'} ];
}
```
{: file='app.component.ts'}

```html
<app-server-element 
  *ngFor="let serverElement of serverElements"
  [element]="serverElement"> <!-- this is setting the element variable for app-server-element -->
  </app-server-element>
```
{: file='app.component.html'}

```typescript
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-server-element',
  templateUrl: './server-element.component.html'
})
export class ServerElementComponent implements OnInit {
  // this annotation is to tell angular that this property can be used to property bind as an input
  @Input()
  element: {type: string, name: string, content: string};

  constructor() { }

  ngOnInit(): void {
  }

}

```
{: file='server-element.component.ts'}

```html
<div 
  class="panel panel-default">
  <div class="panel-heading">{{ element.name }}</div>
  <div class="panel-body">
    <p>
      <strong *ngIf="element.type === 'server'" style="color: red">{{ element.content }}</strong>
      <em *ngIf="element.type === 'blueprint'">{{ element.content }}</em>
    </p>
  </div>
</div>

```
{: file='server-element.component.html'}

If you wanted to bind to the same property but reference it by a different name you would just have to pass that as a string to **@Input('varName')**

```typescript
@Input('myPropertyName')
```

```html
[element]="serverElement"> 
```


# Emitting events with @Output
  - with @Input it allows the parent to bind to a variable in the child component
  - but what if we want our child component notifiy our parent component when a change is made

Here in the app root we are binding to the **serverCreated & blueprintCreated event** 
  - these events are declared in the cockpit typescript file 
  - We bind these to the methods onServerAdded() & onBlueprintAdded() that we have declared in the app root type script file 

```typescript
  <app-cockpit 
    (serverCreated)="onServerAdded($event)"
    (blueprintCreated)="onBlueprintAdded($event)">
    </app-cockpit>
```
{: file='app.component.html'}

Take note of the @Outut annotation  
  - this means that a parent component can bind to it

Take note of **.emit()**
  - We are saying when the button is pressed, it will emmit an event where anyone who is listening for that event will trigger an event to occur

```typescript
@Component({
  // ...
})
export class CockpitComponent {
  @Output()
  serverCreated     = new EventEmitter<{serverName: string, serverContent: string}>();
  @Output()
  blueprintCreated  = new EventEmitter<{serverName: string, serverContent: string}>();

  onAddServer() {
    this.serverCreated.emit({
      serverName: this.newServerName,
      serverContent: this.newServerContent
    });
  }
  
  onAddBlueprint() {
    this.blueprintCreated.emit({
      serverName: this.newServerName,
      serverContent: this.newServerContent
    });
  }
}
```
{: file='cockpit.component.ts'}

# View encapsulation
  - when you have a .css file for a component it will be only applied for that component
  - for example if you set all paragraphs elements be blue it will only assign blue to paragraphs in that specific component only
    - it does this by assigning each html element a unique html attribute and css will reference that html attribute in the css file. 
    - you don't have to nothing to achieve this behavior as it is default
  - this emulates shadow dom

You can change the **view encapsulation** by using the **encapsulation** key in the **@Component** settings
  - you change change to the following options
    - Emulated - default
    - None
    - ShadowDom

```typescript
@Component({
  // ...
  // Three options
  encapsulation: ViewEncapsulation.Emulated
  encapsulation: ViewEncapsulation.None
  encapsulation: ViewEncapsulation.ShadowDom
})
export class ServerElementComponent implements OnInit {
  // ...
}
```

# Using local references in templates
  - you can use local references in templates to pass data to a function instead of using two-way databinding
  - local references are denoted with **#**

Example
  - we are using two local references **#serverNameInput & #contentInput**
  - we can use this local reference in the **template only**
  - we are passing both local references to the functions called by button input

```html
<input 
  type="text" 
  class="form-control" 
  #serverNameInput
  >

<input 
  type="text" 
  class="form-control"
  #contentInput
  >

<br>

<!-- buttons -->
<button class="btn btn-primary" (click)="onAddServer(serverNameInput, contentInput)">Add Server</button>
<button class="btn btn-primary" (click)="onAddBlueprint(contentInput, contentInput)">Add Server Blueprint</button>
```

typescript code
  - in the typescript code we are passing the local references to it by **HtmlInputElements**
  - below is an example of one of the functions taking advantage of passing the local references as arguments

```typescript
  onAddServer(nameInput: HTMLInputElement, contentInput: HTMLInputElement) {
    console.log(nameInput.value);
    this.serverCreated.emit({
      serverName: nameInput.value,
      serverContent: contentInput.value
    });
  }
```

# Accessing Local references through the DOM with @ViewChild
  - in the previous example we see how we can pass the local reference to a function that is executed in the typescript
  - but what if we don't want to pass the variable as an argument just to get the local reference and instead just want to access it directly
  - we can do exactly this with **@ViewChild**

Example html file
  - we have a simple text input with the local reference #contentInput

```html
<input 
  type="text" 
  class="form-control"
  #contentInput
  >
```

Example typescript code
  - to have access to this local reference with @ViewChild()

```typescript
@ViewChild('contentInput', {static: false})
serverContentInput: ElementRef;

myfunc(){
  // accessing the value of the input
  let x = this.serverContentInput.nativeElement.value;
}
```

# Projecting content into component with ng-content
  - if want to project content into your component then look no further than **ng-content**
  - typically used for widgets and complex operations that can be passed from another component

```html
<div 
  class="panel panel-default">
  <div class="panel-body">

    <!-- contents get projected here -->
    <ng-content></ng-content>

  </div>
</div>
```

```html
<app-server-element 
  *ngFor="let serverElement of serverElements"
  [element]="serverElement"> 

  <!-- element that is getting projected -->
  <p>
    <strong *ngIf="serverElement.type === 'server'" style="color: red">{{ serverElement.content }}</strong>
    <em *ngIf="serverElement.type === 'blueprint'">{{ serverElement.content }}</em>
  </p>
  <!-- element that is getting projected -->

  </app-server-element>
```


# Component lifecycle
  - stuff 