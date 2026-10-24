import 'package:flutter/material.dart';

// COLORES
const verde = Color(0xFF21452C);
const lila = Color(0xFFEEEafa);

// COMPONENTES VISUALES
Widget campo(
  String titulo, {
  String? valor,
  IconData icono = Icons.edit_outlined,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE5E6E8)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icono, size: 16, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  valor ?? titulo,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget boton(String texto, {bool claro = false}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: claro ? lila : verde,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: claro ? verde : Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    ),
  );
}

Widget tarjeta(Widget child) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE8E8E8)),
    ),
    child: child,
  );
}

Widget item(
  String titulo,
  String subtitulo,
  IconData icono, {
  Color color = verde,
}) {
  return tarjeta(
    Row(
      children: [
        CircleAvatar(
          backgroundColor: lila,
          child: Icon(icono, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitulo,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right,
          size: 18,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget etiqueta(String texto) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: const Color(0xFFE1EFE4),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      texto,
      style: const TextStyle(
        fontSize: 10,
        color: verde,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget progreso(double valor) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: LinearProgressIndicator(
      value: valor,
      minHeight: 7,
      color: const Color(0xFF7262BD),
      backgroundColor: const Color(0xFFE8E4F6),
    ),
  );
}

// ESTRUCTURA GENERAL
class Marco extends StatelessWidget {
  final String titulo;
  final List<Widget> hijos;
  final bool nav;

  const Marco({
    super.key,
    required this.titulo,
    required this.hijos,
    this.nav = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verde,
        foregroundColor: Colors.white,
        title: Text(
          titulo,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: hijos,
        ),
      ),
      bottomNavigationBar: nav
          ? const BottomAppBar(
              color: verde,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.track_changes, color: Colors.white),
                  Icon(Icons.menu_book, color: Colors.white),
                  Icon(Icons.people, color: Colors.white),
                  Icon(Icons.more_horiz, color: Colors.white),
                ],
              ),
            )
          : null,
    );
  }
}

// 1. BIENVENIDA
class BienvenidaPantalla extends StatelessWidget {
  const BienvenidaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF10291B),
              Color(0xFF47694C),
              Color(0xFFB7A57B),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                const Spacer(),
                const Icon(
                  Icons.spa_outlined,
                  color: Colors.white,
                  size: 75,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Apoyo Personal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Pequeños pasos, grandes cambios',
                  style: TextStyle(color: Colors.white70),
                ),
                const Spacer(flex: 3),
                boton('Iniciar sesión'),
                const SizedBox(height: 12),
                boton('Crear cuenta', claro: true),
                const SizedBox(height: 15),
                const Text(
                  'Continuar como invitado',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 2. REGISTRO
class RegistroPantalla extends StatelessWidget {
  const RegistroPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Crear cuenta',
      hijos: [
        const Text(
          'Comienza tu proceso',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 30),
        campo(
          'Correo electrónico',
          valor: 'tu@correo.com',
          icono: Icons.email_outlined,
        ),
        campo(
          'Contraseña',
          valor: '••••••••',
          icono: Icons.lock_outline,
        ),
        campo(
          'Confirmar contraseña',
          valor: '••••••••',
          icono: Icons.lock_outline,
        ),
        const SizedBox(height: 20),
        boton('Registrarse'),
        const SizedBox(height: 22),
        const Center(
          child: Text(
            '¿Ya tienes cuenta? Iniciar sesión',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

// 3. PERFIL ANÓNIMO
class PerfilAnonimoPantalla extends StatelessWidget {
  const PerfilAnonimoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Tu perfil anónimo',
      hijos: [
        const Text(
          'Elige un nombre que te represente. '
          'Será visible para la comunidad.',
        ),
        const SizedBox(height: 36),
        const Center(
          child: CircleAvatar(
            radius: 52,
            backgroundColor: lila,
            child: Icon(
              Icons.person,
              color: Color(0xFF7262BD),
              size: 65,
            ),
          ),
        ),
        const SizedBox(height: 30),
        campo('Nombre anónimo', valor: 'NombreAnónimo'),
        tarjeta(
          const Text(
            'Este nombre no mostrará tu identidad real '
            'y te permitirá participar de forma segura '
            'en la comunidad.',
            style: TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(height: 20),
        boton('Continuar'),
      ],
    );
  }
}

// 4. INICIO
class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Hola, NombreAnónimo',
      nav: true,
      hijos: [
        const Text(
          'Un día a la vez, un gran paso',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        tarjeta(
          Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.track_changes),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Mi objetivo actual\n'
                      'Evitar consumo de Alcohol',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              etiqueta('En curso · 12 días'),
              const SizedBox(height: 18),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '12\nDías sin consumo',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '0\nRecaídas',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '85%\nAvance',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Text(
          'Acciones rápidas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        item(
          'Registrar hoy',
          'Agregar seguimiento',
          Icons.calendar_today,
        ),
        item(
          'Mis objetivos',
          'Revisar mis metas',
          Icons.track_changes,
        ),
        item(
          'Información',
          'Conoce las sustancias',
          Icons.menu_book,
        ),
        item(
          'Comunidad',
          'Comparte tu experiencia',
          Icons.people,
        ),
        tarjeta(
          const Text(
            '“Cada día es una nueva oportunidad '
            'para ser la mejor versión de ti.”',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// 5. MIS OBJETIVOS
class ObjetivosPantalla extends StatelessWidget {
  const ObjetivosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Mis objetivos',
      nav: true,
      hijos: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('En curso'),
            Text('Completados'),
            Text('Interrumpidos'),
          ],
        ),
        const SizedBox(height: 22),
        item(
          'Evitar consumo de Alcohol',
          '12 días de 40 días · En curso',
          Icons.no_drinks,
        ),
        progreso(0.3),
        const SizedBox(height: 20),
        item(
          'Mantenerme sin Tabaco',
          '32 días de 90 días · En curso',
          Icons.smoke_free,
        ),
        progreso(0.36),
      ],
    );
  }
}

// 6. NUEVO OBJETIVO
class NuevoObjetivoPantalla extends StatelessWidget {
  const NuevoObjetivoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Nuevo objetivo',
      hijos: [
        campo(
          'Sustancia',
          valor: 'Alcohol',
          icono: Icons.local_bar_outlined,
        ),
        const Text(
          'Tipo de objetivo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          '◉ Predeterminado     ○ Personalizado',
        ),
        const SizedBox(height: 20),
        campo(
          'Fecha de inicio',
          valor: '01/10/2024',
          icono: Icons.calendar_month,
        ),
        campo(
          'Fecha de fin',
          valor: '31/12/2024',
          icono: Icons.calendar_month,
        ),
        campo(
          'Duración (días)',
          valor: '90',
        ),
        const SizedBox(height: 20),
        boton('Guardar objetivo'),
      ],
    );
  }
}

// 7. DETALLE DEL OBJETIVO
class DetalleObjetivoPantalla extends StatelessWidget {
  const DetalleObjetivoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Detalle del objetivo',
      hijos: [
        item(
          'Evitar consumo de Alcohol',
          'En curso',
          Icons.no_drinks,
        ),
        const SizedBox(height: 12),
        const Text('01/10/2024 - 31/12/2024'),
        const SizedBox(height: 14),
        progreso(0.3),
        const SizedBox(height: 12),
        const Text('12 días                         40 días'),
        const SizedBox(height: 20),
        campo('Sustancia', valor: 'Alcohol'),
        campo('Tipo', valor: 'Predeterminado'),
        campo('Estado', valor: 'En curso'),
        campo('Duración', valor: '40 días'),
        boton('Registrar seguimiento'),
        const SizedBox(height: 12),
        boton('Editar objetivo', claro: true),
      ],
    );
  }
}

// 8. REGISTRAR SEGUIMIENTO
class RegistrarSeguimientoPantalla extends StatelessWidget {
  const RegistrarSeguimientoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Registrar seguimiento',
      hijos: [
        campo(
          'Fecha',
          valor: '03/10/2024',
          icono: Icons.calendar_month,
        ),
        campo(
          'Hora de registro',
          valor: '18:30',
          icono: Icons.access_time,
        ),
        const Text(
          'Estado',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        item(
          'Sin consumo',
          'Hoy no consumí',
          Icons.check_circle,
          color: Colors.green,
        ),
        item(
          'Hubo consumo',
          'Sí consumí',
          Icons.cancel,
          color: Colors.red,
        ),
        const SizedBox(height: 12),
        const Text('Es retrospectivo    ○'),
        const SizedBox(height: 24),
        boton('Guardar'),
      ],
    );
  }
}

// 9. HISTORIAL
class HistorialPantalla extends StatelessWidget {
  const HistorialPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Seguimiento',
      hijos: [
        const Text('Evitar consumo de Alcohol'),
        const SizedBox(height: 20),
        item(
          '09/10/2024     18:30',
          'Sin consumo',
          Icons.check_circle,
          color: Colors.green,
        ),
        item(
          '08/10/2024     21:10',
          'Hubo consumo',
          Icons.cancel,
          color: Colors.red,
        ),
        item(
          '07/10/2024     19:05',
          'Sin consumo',
          Icons.check_circle,
          color: Colors.green,
        ),
        item(
          '06/10/2024     18:00',
          'Sin consumo',
          Icons.check_circle,
          color: Colors.green,
        ),
        item(
          '05/10/2024     22:15',
          'Hubo consumo',
          Icons.cancel,
          color: Colors.red,
        ),
      ],
    );
  }
}

// 10. SUSTANCIAS
class SustanciasPantalla extends StatelessWidget {
  const SustanciasPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Sustancias',
      nav: true,
      hijos: [
        item('Alcohol', '', Icons.local_bar),
        item('Tabaco', '', Icons.smoking_rooms),
        item('Marihuana', '', Icons.eco),
        item('Cocaína', '', Icons.science),
        item('Metanfetaminas', '', Icons.warning_amber),
        item('Otras sustancias', '', Icons.medication),
      ],
    );
  }
}

// 11. DETALLE DE SUSTANCIA
class DetalleSustanciaPantalla extends StatelessWidget {
  const DetalleSustanciaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Alcohol',
      hijos: [
        const Center(
          child: Icon(
            Icons.local_bar,
            color: Colors.amber,
            size: 55,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Descripción',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'El alcohol es una sustancia psicoactiva '
          'que afecta al sistema nervioso central.',
        ),
        const SizedBox(height: 22),
        const Text(
          'Efectos a corto plazo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          '• Relajación\n'
          '• Desinhibición\n'
          '• Dificultad para coordinar movimientos',
        ),
        const SizedBox(height: 22),
        const Text(
          'Efectos a largo plazo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          '• Daño al hígado\n'
          '• Problemas de memoria\n'
          '• Dependencia',
        ),
        const SizedBox(height: 22),
        item(
          'Riesgos',
          'Ver información',
          Icons.warning_amber,
        ),
        item(
          'Señales de dependencia',
          'Ver información',
          Icons.info_outline,
        ),
        item(
          'Recursos de ayuda',
          'Ver información',
          Icons.support_agent,
        ),
      ],
    );
  }
}

// 12. COMUNIDAD
class ComunidadPantalla extends StatelessWidget {
  const ComunidadPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Comunidad',
      nav: true,
      hijos: [
        const Row(
          children: [
            Text('Publicaciones'),
            SizedBox(width: 24),
            Text('Mis publicaciones'),
          ],
        ),
        const SizedBox(height: 18),
        tarjeta(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🟣 NombreAnónimo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Hoy cumplí una semana sin consumir. '
                'Me siento mucho mejor 💪',
              ),
              SizedBox(height: 14),
              Text('❤️ 12       ♡ 3'),
            ],
          ),
        ),
        tarjeta(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🟣 CaminoLibre',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'El apoyo de esta comunidad me motiva. '
                '¡Sigamos adelante!',
              ),
              SizedBox(height: 14),
              Text('❤️ 8       ♡ 1'),
            ],
          ),
        ),
        tarjeta(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🟣 NuevoComienzo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Agradezco los consejos para los primeros días. '
                '¡No estamos solos!',
              ),
              SizedBox(height: 14),
              Text('❤️ 5       ♡ 2'),
            ],
          ),
        ),
      ],
    );
  }
}

// 13. PUBLICACIÓN
class PublicacionPantalla extends StatelessWidget {
  const PublicacionPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Publicación',
      hijos: [
        tarjeta(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🟣 NombreAnónimo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'hace 2 horas',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Hoy completé una semana sin consumo. '
                'Me siento mucho mejor 💪',
              ),
              SizedBox(height: 15),
              Text('❤️ 12       ♡ 3'),
            ],
          ),
        ),
        const Text(
          'Comentarios',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        item(
          'CaminoLibre',
          '¡Felicidades! Sigue así 🙌',
          Icons.account_circle,
        ),
        item(
          'VidaNueva',
          'Es un gran logro, cada día cuenta.',
          Icons.account_circle,
        ),
        const SizedBox(height: 25),
        campo(
          'Escribe un comentario...',
          valor: 'Escribe un comentario...',
        ),
      ],
    );
  }
}

// 14. CONFIGURACIÓN
class ConfiguracionPantalla extends StatelessWidget {
  const ConfiguracionPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Marco(
      titulo: 'Más',
      nav: true,
      hijos: [
        item('Mi cuenta', '', Icons.person_outline),
        item(
          'Mi perfil anónimo',
          '',
          Icons.account_circle_outlined,
        ),
        item(
          'Notificaciones',
          '',
          Icons.notifications_none,
        ),
        item(
          'Modo oscuro',
          '',
          Icons.dark_mode_outlined,
        ),
        item(
          'Acerca de la app',
          '',
          Icons.info_outline,
        ),
        item(
          'Cerrar sesión',
          '',
          Icons.logout,
          color: Colors.red,
        ),
      ],
    );
  }
}
