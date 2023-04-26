import 'package:flutter/material.dart';
import 'package:perfect_vision/src/pages/afecciones/presbicia.dart';
import 'package:perfect_vision/src/pages/ar_page.dart';
import 'package:perfect_vision/src/pages/blog.dart';
import 'package:perfect_vision/src/pages/chatbot.dart';
import 'package:perfect_vision/src/pages/portafolio_page.dart';
import 'package:perfect_vision/src/pages/settings_page.dart';
import 'package:perfect_vision/src/pages/video_module.dart';

import '../pages/3d_pages/ojo_humano_page.dart';
import '../pages/basico_page.dart';
import '../pages/botones_page.dart';
import '../pages/3d_pages/calavera_humana_page.dart';
import '../pages/3d_pages/cerebro_humano_page.dart';
import '../pages/list_pages/images_3d_page.dart';
import '../pages/list_pages/nearvision_page.dart';
import '../pages/list_pages/pruebas_page.dart';
import '../pages/list_pages/vision_test_page.dart';
import '../pages/login_page.dart';
import '../pages/meds_page.dart';
import '../pages/scroll_page.dart';
import '../pages/test_pages/test_10feet_page.dart';
import '../pages/test_pages/test_20feet_page.dart';
import '../pages/test_pages/test_alfabeto.dart';
import '../pages/test_pages/test_duocromo.dart';
import '../pages/test_pages/test_invertido.dart';
import '../pages/test_pages/test_ishihara.dart';
import '../pages/test_pages/test_numeros.dart';
import '../pages/test_pages/test_simbolos.dart';
import '../pages/test_pages/test_snellen.dart';
import '../pages/test_pages/test_visioncercana.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'basico': (BuildContext context) => const BasicoPage(),
    '/': (BuildContext context) => const ScrollPage(),
    'botones': (BuildContext context) => const BotonesPage(),
    'pruebas': (BuildContext context) => const PruebasPage(),
    'tDuocromo': (BuildContext context) => const DuocromoPage(),
    'tSnellen': (BuildContext context) => const SnellenPage(),
    'tIshihara': (BuildContext context) => const IshiharaPage(),
    'geleria3d': (BuildContext context) => const Galeria3DPage(),
    'ojoHumano': (BuildContext context) => const OjoHumanoPage(),
    'cerebroHumano': (BuildContext context) => const CerebroHumanoPage(),
    'calaveraHumana': (BuildContext context) => const CalaveraHumanaPage(),
    'medicamentos': (BuildContext context) => MedicationList(),
    'visionTestPage': (BuildContext context) => const TestVisionPage(),
    '10Feet': (BuildContext context) => const Feet10Page(),
    '20Feet': (BuildContext context) => const Feet20Page(),
    'nearVisionCard': (BuildContext context) => const VisionCercanaPage(),
    'testVisionPage': (BuildContext context) => const NearVisionPage(),
    'numeros': (BuildContext context) => const NumerosPage(),
    'simbolos': (BuildContext context) => const SimbolosPage(),
    'alfabeto': (BuildContext context) => const AlfabetoPage(),
    'nearVisionCardInverted': (BuildContext context) =>
        const VisionCercanaInvertidoPage(),
    'realidad': (BuildContext context) => const RealidadAumentadaPage(),
    'blog': (BuildContext context) => const BlogPage(),
    'settings': (BuildContext context) => const SettingsPage(),
    'portafolio': (BuildContext context) => const PortafolioPage(),
    'chat': (BuildContext context) => const ChatPage(),
    'ar': (BuildContext context) => const ArCorePage(),
    'presbicia': (BuildContext context) => const PresbiciaPage(),
  };
}
