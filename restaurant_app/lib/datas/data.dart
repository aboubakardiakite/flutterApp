import 'package:restaurant_app/models/city_model.dart';

import '../models/activity_model.dart';

List<CityModel> cities = [
  CityModel(image: 'asserts/images/paris.jpeg', name: 'Paris', activities: activitiesParis),
  CityModel(image: 'asserts/images/lyon.jpg', name: 'Lyon', activities: activitiesLyon),
  CityModel(image: 'asserts/images/lille.jpeg', name: 'Lille', activities: activitiesLille),
];



List<Activity> activitiesParis = [
  Activity(
      name: 'Notre dame',
      city: 'Paris',
      image: 'asserts/images/activities/paris/dame.jpeg',
      id: 'a1',
      price: 10.0),
  Activity(
      name: 'Disneyland paris',
      city: 'Paris',
      image: 'asserts/images/activities/paris/disneyland-parc.jpg',
      id: 'a2',
      price: 50.0),
  Activity(
      name: 'Tour Eiffel',
      city: 'Paris',
      image: 'asserts/images/activities/paris/eiffel.jpg',
      id: 'a3',
      price: 20.0),
  Activity(
      name: 'Champs elysees',
      city: 'Paris',
      image: 'asserts/images/activities/paris/elysees.jpeg',
      id: 'a4',
      price: 5.0),
  Activity(
      name: 'Louvre',
      city: 'Paris',
      image: 'asserts/images/activities/paris/louvre.jpg',
      id: 'a5',
      price: 15.0),
  Activity(
      name: 'Parc asterix',
      city: 'Paris',
      image: 'asserts/images/activities/paris/parc-asterix.jpg',
      id: 'a6',
      price: 40.0),
];

List<Activity> activitiesLille = [
  Activity(
    name: 'metro bowling lille',
    city: 'Lille',
    image: 'asserts/images/activities/lille/bowling.jpg',
    id: 'a7',
    price: 10.0,
  ),
  Activity(
    name: 'pixabay de lille',
    city: 'Lille',
    image: 'asserts/images/activities/lille/pixabay.png',
    id: 'a8',
    price: 5.0,
  ),
  Activity(
    name: 'piscine de lille',
    city: 'Lille',
    image: 'asserts/images/activities/lille/piscine.jpg',
    id: 'a9',
    price: 5.0,
  ),
  Activity(
    name: 'quizroom de lille',
    city: 'Lille',
    image: 'asserts/images/activities/lille/quizroom.jpeg',
    id: 'a10',
    price: 10.0,
  ),
  Activity(
    name: 'cityCrunch de lille',
    city: 'Lille',
    image: 'asserts/images/activities/lille/cityCrunch.jpg',
    id: 'a11',
    price: 10.0,
  ),
];

List<Activity> activitiesLyon = [
  Activity(
    name: 'bubble-foot',
    city: 'Lyon',
    image: 'asserts/images/activities/lyon/bubble-foot.jpg',
    id: 'a12',
    price: 10.0,
  ),
  Activity(
    name: 'La surfeuse',
    city: 'Lyon',
    image: 'asserts/images/activities/lyon/la-surfeuse.jpg',
    id: 'a13',
    price: 5.0,
  ),
  Activity(
    name: 'segway',
    city: 'Lyon',
    image: 'asserts/images/activities/lyon/segway.jpg',
    id: 'a14',
    price: 5.0,
  ),
  Activity(
    name: 'vélo electrique',
    city: 'Lyon',
    image: 'asserts/images/activities/lyon/velo-electrique.jpg',
    id: 'a15',
    price: 10.0,
  ),
  Activity(
    name: 'visite en vélo',
    city: 'Lyon',
    image: 'asserts/images/activities/lyon/visite-en-velo.jpg',
    id: 'a16',
    price: 10.0,
  ),
];
