# galapagos_trip_app

A new Flutter project.

## DEPENDENCIAS
- provider 6.0.5
- go_router 7.1.1
- flutter_bloc 8.1.2
- equatable 2.5.0
- formz 0.6.0
- shared_preferences 2.1.2
- flutter_dotenv 5.1.0
- dio 5.2.1+1
- riverpod 2.3.6
- open_file: ^3.3.2
- path_provider: ^2.0.15
- google_fonts: ^5.1.0
- carousel_slider: ^4.2.1

## ARQUITECTURA

- UI / PRESENTACION / REPOSITORIO DATASOURCE / INFORMACION REGRESA UI


## CONFIG LOCAL STORAGE 
- Añadir a AndroidManifest..xml

    1. xmlns:tools="http://schemas.android.com/tools">
    2. <uses-permission android:name="android.permission.INTERNET"/>
    3. <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    4. <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>