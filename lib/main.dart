import 'package:flutter/material.dart';
import 'pantallas/pantallas.dart';
void main() => runApp(const ApoyoApp());
class ApoyoApp extends StatelessWidget {
 const ApoyoApp({super.key});
 @override Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner:false,title:'Apoyo Personal',theme:ThemeData(useMaterial3:true,scaffoldBackgroundColor:const Color(0xfff9faf9),colorScheme:ColorScheme.fromSeed(seedColor:const Color(0xff21452c))),home:const GaleriaVistas());
}
class GaleriaVistas extends StatelessWidget {
 const GaleriaVistas({super.key});
 @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Vistas · Apoyo Personal')),body:ListView(children:[
 ListTile(leading:CircleAvatar(child:Text('1')),title:const Text('Bienvenida'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const BienvenidaPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('2')),title:const Text('Crear cuenta'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const RegistroPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('3')),title:const Text('Tu perfil anónimo'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const PerfilAnonimoPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('4')),title:const Text('Hola, NombreAnónimo'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const InicioPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('5')),title:const Text('Mis objetivos'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const ObjetivosPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('6')),title:const Text('Nuevo objetivo'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const NuevoObjetivoPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('7')),title:const Text('Detalle del objetivo'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const DetalleObjetivoPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('8')),title:const Text('Registrar seguimiento'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const RegistrarSeguimientoPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('9')),title:const Text('Seguimiento'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const HistorialPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('10')),title:const Text('Sustancias'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const SustanciasPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('11')),title:const Text('Alcohol'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const DetalleSustanciaPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('12')),title:const Text('Comunidad'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const ComunidadPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('13')),title:const Text('Publicación'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const PublicacionPantalla()))),
 ListTile(leading:CircleAvatar(child:Text('14')),title:const Text('Más'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const ConfiguracionPantalla()))),
 ]));
}
