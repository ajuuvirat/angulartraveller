import { NgModule , CUSTOM_ELEMENTS_SCHEMA} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { FeedbackPage } from './feedback.page';

import { RatingPageModule } from '../rating/rating.module';
import { RatingPage } from '../rating/rating.page';

const routes: Routes = [
  {
    path: '',
    component: FeedbackPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    RatingPageModule,
  ],
  declarations: [FeedbackPage],  
  //schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class FeedbackPageModule {}
