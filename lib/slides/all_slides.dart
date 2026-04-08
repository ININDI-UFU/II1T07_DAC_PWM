import 'package:flutter/material.dart';
import '../widgets/slide_template.dart';

Widget buildSlide(int index) {
  switch (index) {
    case 0:
      return const TitleSlide(
        key: ValueKey(0),
        title: 'DAC & PWM na ESP32',
        subtitle:
            'Geração de Sinais Analógicos\n\nConversor Digital-Analógico, PWM com LEDC e filtros RC\nAula 13 • Sistemas Embarcados',
        chip: 'SINAIS ANALÓGICOS',
        accentColor: Color(0xFF3B82F6),
      );
    case 1:
      return CardsSlide(
        key: const ValueKey(1),
        title: 'Agenda',
        subtitle: 'Conteúdo da aula',
        accentColor: const Color(0xFF3B82F6),
        cards: const [
          InfoCardData(
            title: '01. Fundamentos',
            description: 'Sinais digitais vs analógicos na ESP32',
            icon: Icons.graphic_eq_rounded,
            color: Color(0xFF3B82F6),
          ),
          InfoCardData(
            title: '02. DAC Nativo',
            description: 'GPIO25/GPIO26 — 8 bits, conversão direta',
            icon: Icons.tune_rounded,
            color: Color(0xFF8B5CF6),
          ),
          InfoCardData(
            title: '03. PWM (LEDC)',
            description: 'LED Control — 16 canais, até 40 MHz',
            icon: Icons.waves_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: '04. PWM + Filtro RC',
            description: 'Geração de sinal analógico com mais resolução',
            icon: Icons.filter_alt_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: '05. PWM Dual (16-bit)',
            description: 'Técnica para 16 bits de resolução',
            icon: Icons.precision_manufacturing_rounded,
            color: Color(0xFF3B82F6),
          ),
          InfoCardData(
            title: '06. Comparação',
            description: 'DAC vs PWM vs PWM+RC vs DAC externo',
            icon: Icons.compare_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: '07. Código',
            description: 'Exemplos práticos com PlatformIO',
            icon: Icons.code_rounded,
            color: Color(0xFF8B5CF6),
          ),
          InfoCardData(
            title: '08. Aplicações',
            description: 'Geração de formas de onda e controle',
            icon: Icons.devices_rounded,
            color: Color(0xFFF59E0B),
          ),
        ],
        crossAxisCount: 4,
      );
    case 2:
      return ContentSlide(
        key: const ValueKey(2),
        title: 'Sinais Digitais vs Analógicos',
        subtitle: 'Por que precisamos converter?',
        accentColor: const Color(0xFF3B82F6),
        items: const [
          ContentItem(
            text: 'ESP32 é digital: processa 0s e 1s, não valores contínuos',
            icon: Icons.memory_rounded,
            iconColor: Color(0xFF3B82F6),
            isBold: true,
          ),
          ContentItem(
            text: 'O mundo real é analógico: tensão, temperatura, som, luz',
            icon: Icons.public_rounded,
            iconColor: Color(0xFF00D4AA),
            isBold: true,
          ),
          ContentItem(
            text: 'ADC: Analógico → Digital (entrada — já estudamos)',
            icon: Icons.input_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
          ContentItem(
            text: 'DAC: Digital → Analógico (saída — foco desta aula)',
            icon: Icons.output_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text:
                'Aplicações: áudio, controle de motores, referência de tensão',
            icon: Icons.settings_rounded,
          ),
          ContentItem(
            text: 'Escolha depende de: resolução, velocidade, custo, pinos',
            icon: Icons.tune_rounded,
          ),
        ],
      );
    case 3:
      return const SectionTitleSlide(
        key: ValueKey(3),
        sectionNumber: '01',
        title: 'DAC Nativo da ESP32',
        subtitle:
            'Conversão direta Digital → Analógico\n8 bits • 2 canais • GPIO25 / GPIO26',
        accentColor: Color(0xFF8B5CF6),
        icon: Icons.tune_rounded,
      );
    case 4:
      return ContentSlide(
        key: const ValueKey(4),
        title: 'DAC — Arquitetura',
        subtitle: 'Conversor R-2R de 8 bits integrado',
        accentColor: const Color(0xFF8B5CF6),
        items: const [
          ContentItem(
            text: '2 canais independentes: DAC1 = GPIO25, DAC2 = GPIO26',
            icon: Icons.memory_rounded,
            iconColor: Color(0xFF8B5CF6),
            isBold: true,
          ),
          ContentItem(
            text: '8 bits de resolução: 256 níveis (0 a 255)',
            icon: Icons.linear_scale_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text: 'Saída: 0V a 3.3V proporcional ao valor escrito',
            icon: Icons.trending_up_rounded,
          ),
          ContentItem(
            text: 'Rede R-2R interna: resistores de precisão para conversão',
            icon: Icons.settings_input_component_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Velocidade: até ~300 ksps (amostras por segundo)',
            icon: Icons.speed_rounded,
          ),
          ContentItem(
            text:
                'Impedância de saída: ~100Ω — pode necessitar de buffer (op-amp)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Fórmula: Vout = (valor / 255) × 3.3V',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
        ],
      );
    case 5:
      return ContentSlide(
        key: const ValueKey(5),
        title: 'DAC — Limitações',
        subtitle: 'Quando 8 bits não são suficientes',
        accentColor: const Color(0xFF8B5CF6),
        items: const [
          ContentItem(
            text: 'Apenas 8 bits: resolução de 12.9 mV por degrau (3.3V/256)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
            isBold: true,
          ),
          ContentItem(
            text: 'Somente 2 pinos fixos: GPIO25 e GPIO26 (não remapeável)',
            icon: Icons.pin_drop_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Linearidade: ±2 LSB de erro típico',
            icon: Icons.show_chart_rounded,
          ),
          ContentItem(
            text: 'Sem DMA integrado: CPU precisa alimentar o DAC',
            icon: Icons.timer_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Glitch na transição: spikes ao mudar valor rapidamente',
            icon: Icons.bolt_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text:
                'Alternativas: PWM+RC (mais resolução), DAC externo (MCP4725, 12-bit)',
            icon: Icons.compare_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
        ],
      );
    case 6:
      return const CodeSlide(
        key: ValueKey(6),
        title: 'DAC — Código PlatformIO',
        subtitle: 'ESP32 • dacWrite() • Rampa e valor fixo',
        accentColor: Color(0xFF8B5CF6),
        code: '''#include <Arduino.h>

#define DAC_PIN 25  // GPIO25 = DAC1

void setup() {
  Serial.begin(115200);
}

void loop() {
  // Gera rampa de 0 a 3.3V
  for (int i = 0; i < 256; i++) {
    dacWrite(DAC_PIN, i);
    delayMicroseconds(100);
  }

  // Valor fixo: 1.65V (metade de 3.3V)
  dacWrite(DAC_PIN, 128);
  delay(1000);

  // Valor fixo: 2.5V
  dacWrite(DAC_PIN, 194);  // 194/255 * 3.3 ≈ 2.5V
  delay(1000);
}''',
        explanationPoints: [
          'dacWrite(pin, valor) — 0 a 255',
          'GPIO25 = DAC1, GPIO26 = DAC2',
          'Rampa: varre todos os 256 níveis',
          '128 → 1.65V (metade da escala)',
          '194 → ~2.5V (proporcional)',
          'delayMicroseconds controla velocidade',
        ],
      );
    case 7:
      return const SectionTitleSlide(
        key: ValueKey(7),
        sectionNumber: '02',
        title: 'PWM — Pulse Width Modulation',
        subtitle: 'LEDC • 16 canais • Até 40 MHz • Resolução configurável',
        accentColor: Color(0xFFF59E0B),
        icon: Icons.waves_rounded,
      );
    case 8:
      return ContentSlide(
        key: const ValueKey(8),
        title: 'PWM — Fundamentos',
        subtitle: 'Como funciona a modulação por largura de pulso',
        accentColor: const Color(0xFFF59E0B),
        items: const [
          ContentItem(
            text: 'PWM alterna rapidamente entre HIGH e LOW em frequência fixa',
            icon: Icons.waves_rounded,
            iconColor: Color(0xFFF59E0B),
            isBold: true,
          ),
          ContentItem(
            text: 'Duty Cycle: % do período em que o sinal fica HIGH',
            icon: Icons.percent_rounded,
            iconColor: Color(0xFF3B82F6),
            isBold: true,
          ),
          ContentItem(
            text: '0% = sempre LOW, 50% = metade HIGH/LOW, 100% = sempre HIGH',
            icon: Icons.linear_scale_rounded,
          ),
          ContentItem(
            text: 'Valor médio: Vavg = DutyCycle × Vcc (3.3V)',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'LED com 50% duty → brilho médio (olho não percebe o piscar)',
            icon: Icons.lightbulb_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Motor com 75% duty → 75% da velocidade máxima',
            icon: Icons.settings_rounded,
          ),
        ],
      );
    case 9:
      return ContentSlide(
        key: const ValueKey(9),
        title: 'LEDC — LED Control no ESP32',
        subtitle: 'Hardware dedicado para geração de PWM',
        accentColor: const Color(0xFFF59E0B),
        items: const [
          ContentItem(
            text: '16 canais independentes (8 high-speed + 8 low-speed)',
            icon: Icons.grid_view_rounded,
            iconColor: Color(0xFFF59E0B),
            isBold: true,
          ),
          ContentItem(
            text: 'Resolução: 1 a 20 bits (configurável por canal)',
            icon: Icons.tune_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text: 'Frequência: 1 Hz a 40 MHz (depende da resolução)',
            icon: Icons.speed_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
          ContentItem(
            text: 'freq × 2^resolução ≤ 80 MHz (APB clock)',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text:
                'Exemplos: 5 kHz × 2^13 = 40.96 MHz (OK), 1 kHz × 2^16 = 65.5 MHz (OK)',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Vinculação via GPIO Matrix: qualquer GPIO pode ser PWM',
            icon: Icons.device_hub_rounded,
          ),
          ContentItem(
            text: 'Hardware gera o sinal — CPU fica livre para outras tarefas',
            icon: Icons.memory_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
        ],
      );
    case 10:
      return const CodeSlide(
        key: ValueKey(10),
        title: 'PWM — Código com LEDC',
        subtitle: 'ESP32 • ledcSetup / ledcAttachPin / ledcWrite',
        accentColor: Color(0xFFF59E0B),
        code: '''#include <Arduino.h>

#define PWM_PIN  2
#define CHANNEL  0
#define FREQ     5000  // 5 kHz
#define RES_BITS 13    // 8192 níveis

void setup() {
  Serial.begin(115200);
  ledcSetup(CHANNEL, FREQ, RES_BITS);
  ledcAttachPin(PWM_PIN, CHANNEL);
}

void loop() {
  // Rampa de 0% a 100%
  int maxDuty = (1 << RES_BITS) - 1;
  for (int d = 0; d <= maxDuty; d += 10) {
    ledcWrite(CHANNEL, d);
    delayMicroseconds(50);
  }
  delay(500);
}''',
        explanationPoints: [
          'ledcSetup(canal, freq, bits) — configura',
          'ledcAttachPin(pino, canal) — vincula GPIO',
          'ledcWrite(canal, duty) — define duty cycle',
          '13 bits → 8192 níveis (vs 256 do DAC)',
          'Frequência: 5 kHz × 2^13 = 40.96 MHz ≤ 80 MHz ✓',
          'Hardware LEDC gera o sinal automaticamente',
        ],
      );
    case 11:
      return const SectionTitleSlide(
        key: ValueKey(11),
        sectionNumber: '03',
        title: 'PWM + Filtro RC',
        subtitle:
            'Geração de sinal analógico com alta resolução\nFiltro passa-baixa converte PWM em DC',
        accentColor: Color(0xFF00D4AA),
        icon: Icons.filter_alt_rounded,
      );
    case 12:
      return ContentSlide(
        key: const ValueKey(12),
        title: 'Filtro RC — Teoria',
        subtitle: 'Convertendo PWM em tensão analógica',
        accentColor: const Color(0xFF00D4AA),
        items: const [
          ContentItem(
            text: 'Filtro RC passa-baixa: suaviza a onda quadrada PWM',
            icon: Icons.filter_alt_rounded,
            iconColor: Color(0xFF00D4AA),
            isBold: true,
          ),
          ContentItem(
            text: 'fc = 1 / (2π × R × C) — frequência de corte',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text: 'fc << fPWM: boa filtragem, saída mais suave',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'fc >> fPWM: pouca filtragem, muito ripple',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Exemplo: R=10kΩ, C=100nF → fc = 159 Hz',
            icon: Icons.settings_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Para fPWM=5kHz: atenuação ~30 dB → ripple de ~3%',
            icon: Icons.show_chart_rounded,
          ),
          ContentItem(
            text: 'Estágio duplo (2ª ordem): R-C-R-C → atenuação ~60 dB',
            icon: Icons.layers_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
        ],
      );
    case 13:
      return ContentSlide(
        key: const ValueKey(13),
        title: 'PWM + RC — Dimensionamento',
        subtitle: 'Escolhendo R e C para sua aplicação',
        accentColor: const Color(0xFF00D4AA),
        items: const [
          ContentItem(
            text: 'Regra: fc ≈ fPWM / 10 (atenuação ~20 dB por década)',
            icon: Icons.rule_rounded,
            iconColor: Color(0xFF00D4AA),
            isBold: true,
          ),
          ContentItem(
            text: 'fPWM = 5 kHz → fc ≈ 500 Hz → R=3.3kΩ, C=100nF',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text: 'fPWM = 20 kHz → fc ≈ 2 kHz → R=1kΩ, C=100nF',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
          ContentItem(
            text:
                'Tradeoff: fc mais baixo → menos ripple, MAS resposta mais lenta',
            icon: Icons.swap_horiz_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Tempo de estabilização: ~5τ = 5×R×C',
            icon: Icons.timer_rounded,
          ),
          ContentItem(
            text: 'R muito baixo: corrente alta no GPIO (máx ~12 mA)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'Buffer (op-amp) na saída: evita carga afetar o filtro',
            icon: Icons.settings_input_component_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
        ],
      );
    case 14:
      return const CodeSlide(
        key: ValueKey(14),
        title: 'PWM + RC — Código',
        subtitle: 'ESP32 • Geração de senoide via PWM filtrado',
        accentColor: Color(0xFF00D4AA),
        code: '''#include <Arduino.h>
#include <math.h>

#define PWM_PIN  2
#define CHANNEL  0
#define FREQ     20000  // 20 kHz
#define RES_BITS 10     // 1024 níveis

const int maxDuty = (1 << RES_BITS) - 1;
float t = 0;

void setup() {
  ledcSetup(CHANNEL, FREQ, RES_BITS);
  ledcAttachPin(PWM_PIN, CHANNEL);
}

void loop() {
  // Senoide 50 Hz
  float seno = sin(2 * PI * 50.0 * t);
  int duty = (int)((seno + 1.0) / 2.0 * maxDuty);
  ledcWrite(CHANNEL, duty);
  t += 0.00005; // Ts = 50 us
  delayMicroseconds(50);
}''',
        explanationPoints: [
          '20 kHz PWM → fc RC ≈ 2 kHz',
          'sin() gera senoide de 50 Hz',
          'Normaliza [-1,1] para [0, maxDuty]',
          'Filtro RC na saída suaviza o sinal',
          'Resultado: senoide analógica de 50 Hz',
          'Resolução: 10 bits = 1024 níveis',
        ],
      );
    case 15:
      return const SectionTitleSlide(
        key: ValueKey(15),
        sectionNumber: '04',
        title: 'PWM Dual — 16 bits',
        subtitle:
            'Técnica avançada para resolução de 16 bits\nDois canais PWM combinados com rede resistiva',
        accentColor: Color(0xFF3B82F6),
        icon: Icons.precision_manufacturing_rounded,
      );
    case 16:
      return ContentSlide(
        key: const ValueKey(16),
        title: 'PWM Dual — Conceito',
        subtitle: 'Combinando 2 canais de 8 bits → 16 bits efetivos',
        accentColor: const Color(0xFF3B82F6),
        items: const [
          ContentItem(
            text: 'Canal MSB: 8 bits mais significativos (peso 256×)',
            icon: Icons.arrow_upward_rounded,
            iconColor: Color(0xFF3B82F6),
            isBold: true,
          ),
          ContentItem(
            text: 'Canal LSB: 8 bits menos significativos (peso 1×)',
            icon: Icons.arrow_downward_rounded,
            iconColor: Color(0xFF8B5CF6),
            isBold: true,
          ),
          ContentItem(
            text: 'Rede resistiva: R_LSB = 256 × R_MSB',
            icon: Icons.settings_input_component_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Resultado: 65.536 níveis (vs 256 do DAC nativo)',
            icon: Icons.trending_up_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Resolução: 3.3V / 65536 = 50.4 µV por passo',
            icon: Icons.precision_manufacturing_rounded,
          ),
          ContentItem(
            text: 'Requer filtro RC na saída combinada',
            icon: Icons.filter_alt_rounded,
          ),
          ContentItem(
            text: 'Vout = 3.3V × (MSB×256 + LSB) / 65535',
            icon: Icons.calculate_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
        ],
      );
    case 17:
      return const CodeSlide(
        key: ValueKey(17),
        title: 'PWM Dual — Código',
        subtitle: 'ESP32 • 2 canais LEDC → 16 bits',
        accentColor: Color(0xFF3B82F6),
        code: '''#include <Arduino.h>

#define MSB_PIN  25
#define LSB_PIN  26
#define CH_MSB   0
#define CH_LSB   1
#define FREQ     20000
#define BITS     8

void setup() {
  ledcSetup(CH_MSB, FREQ, BITS);
  ledcSetup(CH_LSB, FREQ, BITS);
  ledcAttachPin(MSB_PIN, CH_MSB);
  ledcAttachPin(LSB_PIN, CH_LSB);
}

void setDAC16(uint16_t val) {
  ledcWrite(CH_MSB, val >> 8);   // MSB
  ledcWrite(CH_LSB, val & 0xFF); // LSB
}

void loop() {
  // Rampa 16 bits
  for (uint32_t v = 0; v < 65536; v += 64) {
    setDAC16(v);
    delayMicroseconds(10);
  }
}''',
        explanationPoints: [
          'Dois canais PWM de 8 bits cada',
          'MSB: bits 15-8 (peso 256×)',
          'LSB: bits 7-0 (peso 1×)',
          'Rede resistiva: R_LSB = 256 × R_MSB',
          'Saída combinada filtrada por RC',
          '65.536 níveis vs 256 do DAC nativo',
        ],
      );
    case 18:
      return const SectionTitleSlide(
        key: ValueKey(18),
        sectionNumber: '05',
        title: 'Comparação: DAC vs PWM',
        subtitle: 'Quando usar cada técnica de geração de sinais',
        accentColor: Color(0xFFFF6B6B),
        icon: Icons.compare_rounded,
      );
    case 19:
      return ComparisonSlide(
        key: const ValueKey(19),
        title: 'Comparação Completa',
        accentColor: const Color(0xFF3B82F6),
        headers: const [
          'Critério',
          'DAC Nativo',
          'PWM',
          'PWM+RC',
          'DAC Externo',
        ],
        rows: const [
          ['Resolução', '8 bits', '1-20 bits', '10-16 bits', '12-24 bits'],
          ['Pinos', '2 (fixos)', 'Qualquer GPIO', 'Qualquer GPIO', 'I2C/SPI'],
          [
            'Velocidade',
            '~300 ksps',
            'Até 40 MHz',
            'Limitado por RC',
            'Até 1 Msps',
          ],
          ['Linearidade', 'Boa', 'Excelente', 'Boa', 'Excelente'],
          ['Ripple', 'Nenhum', 'Alto (onda PWM)', 'Baixo (filtrado)', 'Nenhum'],
          ['Custo', 'Zero', 'Zero', 'R + C (centavos)', 'Alto (\$2-\$10)'],
          ['CPU', 'Baixo', 'Zero (LEDC)', 'Zero (LEDC)', 'Baixo (I2C/SPI)'],
          [
            'Uso ideal',
            'Audio simples',
            'LED, motor',
            'Ref. tensão',
            'Precisão',
          ],
        ],
      );
    case 20:
      return ContentSlide(
        key: const ValueKey(20),
        title: 'Critérios de Escolha',
        subtitle: 'Guia prático para selecionar a melhor técnica',
        accentColor: const Color(0xFF3B82F6),
        items: const [
          ContentItem(
            text:
                '✅ DAC nativo: sinal analógico simples, baixa resolução OK (8 bits)',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF8B5CF6),
            isBold: true,
          ),
          ContentItem(
            text:
                '✅ PWM puro: controle de brilho LED, velocidade motor, dimmer',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFFF59E0B),
            isBold: true,
          ),
          ContentItem(
            text:
                '✅ PWM + RC: referência de tensão, geração de waveform, sinais DC',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
            isBold: true,
          ),
          ContentItem(
            text:
                '✅ PWM Dual: quando precisa > 10 bits sem comprar DAC externo',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF3B82F6),
            isBold: true,
          ),
          ContentItem(
            text: '✅ DAC externo (MCP4725): precisão de 12+ bits, áudio hi-fi',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFFFF6B6B),
            isBold: true,
          ),
          ContentItem(
            text:
                '❌ Não use DAC nativo para: áudio de alta fidelidade, DAC de precisão',
            icon: Icons.cancel_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text:
                '❌ Não use PWM puro para: sinais DC — a carga verá a onda quadrada',
            icon: Icons.cancel_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
        ],
      );
    case 21:
      return const SectionTitleSlide(
        key: ValueKey(21),
        sectionNumber: '06',
        title: 'Aplicações Práticas',
        subtitle: 'Formas de onda, audio, controle e instrumentação',
        accentColor: Color(0xFFF59E0B),
        icon: Icons.devices_rounded,
      );
    case 22:
      return CardsSlide(
        key: const ValueKey(22),
        title: 'Geração de Formas de Onda',
        subtitle: 'Diferentes sinais produzidos com DAC e PWM+RC',
        accentColor: const Color(0xFFF59E0B),
        crossAxisCount: 3,
        cards: const [
          InfoCardData(
            title: 'Senoide',
            description:
                'sin(2πft) para testes e áudio. Tabela pré-calculada para velocidade.',
            icon: Icons.graphic_eq_rounded,
            color: Color(0xFF3B82F6),
          ),
          InfoCardData(
            title: 'Rampa / Dente de Serra',
            description: 'Incremento linear para varredura e testes de ADC.',
            icon: Icons.trending_up_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: 'Triangular',
            description: 'Rampa subindo e descendo. Útil para PWM e modulação.',
            icon: Icons.change_history_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'Onda Quadrada',
            description: 'PWM direto — sem filtro. Clock, buzzer, relé.',
            icon: Icons.crop_square_rounded,
            color: Color(0xFF8B5CF6),
          ),
          InfoCardData(
            title: 'Arbitrária',
            description: 'Lookup table com forma de onda personalizada (DDS).',
            icon: Icons.auto_graph_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'Chirp / Sweep',
            description:
                'Frequência varia no tempo. Teste de resposta em frequência.',
            icon: Icons.timeline_rounded,
            color: Color(0xFF34D399),
          ),
        ],
      );
    case 23:
      return const CodeSlide(
        key: ValueKey(23),
        title: 'Geração de Senoide — Lookup Table',
        subtitle: 'ESP32 • DAC + tabela pré-calculada',
        accentColor: Color(0xFFF59E0B),
        code: '''#include <Arduino.h>

#define DAC_PIN 25
#define SAMPLES 256

uint8_t sineTable[SAMPLES];

void setup() {
  // Pré-calcula tabela senoidal
  for (int i = 0; i < SAMPLES; i++) {
    sineTable[i] = (uint8_t)(
      127.5 + 127.5 * sin(2.0 * PI * i / SAMPLES));
  }
}

void loop() {
  // Gera senoide continuamente
  for (int i = 0; i < SAMPLES; i++) {
    dacWrite(DAC_PIN, sineTable[i]);
    delayMicroseconds(39);  // ~100 Hz
    // 1/100Hz = 10ms / 256 amostras ≈ 39 us
  }
}''',
        explanationPoints: [
          'Tabela pré-calculada = máxima velocidade',
          '256 amostras por ciclo da senoide',
          'dacWrite() 8 bits: 0-255 → 0-3.3V',
          'delayMicroseconds define a frequência',
          '39 µs → ~100 Hz de saída',
          'Sem cálculos em runtime (apenas lookup)',
        ],
      );
    case 24:
      return CardsSlide(
        key: const ValueKey(24),
        title: 'Aplicações de DAC',
        subtitle: 'Uso em sistemas embarcados reais',
        accentColor: const Color(0xFF8B5CF6),
        crossAxisCount: 3,
        cards: const [
          InfoCardData(
            title: 'Áudio',
            description:
                'Reprodução de samples, tons, alarmes sonoros via speaker.',
            icon: Icons.volume_up_rounded,
            color: Color(0xFF3B82F6),
          ),
          InfoCardData(
            title: 'Ref. de Tensão',
            description: 'Threshold ajustável para comparadores e triggers.',
            icon: Icons.tune_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: 'Simulação de Sensor',
            description:
                'Gerar sinal conhecido para calibração e teste de ADC.',
            icon: Icons.science_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'Controle de Laser',
            description: 'Ajuste de potência em sistemas de medição óptica.',
            icon: Icons.flashlight_on_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'Gerador de Funções',
            description: 'Mini gerador de bancada: senoide, triangular, rampa.',
            icon: Icons.graphic_eq_rounded,
            color: Color(0xFF8B5CF6),
          ),
          InfoCardData(
            title: 'Offset Analógico',
            description: 'Soma analógica com op-amp para ajustar nível DC.',
            icon: Icons.add_circle_rounded,
            color: Color(0xFF34D399),
          ),
        ],
      );
    case 25:
      return CardsSlide(
        key: const ValueKey(25),
        title: 'Aplicações de PWM',
        subtitle: 'Controle de potência e modulação',
        accentColor: const Color(0xFFF59E0B),
        crossAxisCount: 3,
        cards: const [
          InfoCardData(
            title: 'Controle de LED',
            description: 'Dimmer de brilho com transição suave (fade in/out).',
            icon: Icons.lightbulb_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'Motor DC',
            description: 'Controle de velocidade via ponte H (L298N, TB6612).',
            icon: Icons.settings_rounded,
            color: Color(0xFF3B82F6),
          ),
          InfoCardData(
            title: 'Servo Motor',
            description: 'Posição angular via pulso (500µs–2500µs, 50Hz).',
            icon: Icons.rotate_right_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: 'Buzzer / Tone',
            description: 'Geração de notas musicais com frequência variável.',
            icon: Icons.music_note_rounded,
            color: Color(0xFF8B5CF6),
          ),
          InfoCardData(
            title: 'Aquecimento',
            description: 'Controle de resistência aquecedora (PID + PWM).',
            icon: Icons.thermostat_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'Fonte Chaveada',
            description: 'Step-up/step-down com controle PWM (buck/boost).',
            icon: Icons.bolt_rounded,
            color: Color(0xFF34D399),
          ),
        ],
      );
    case 26:
      return ContentSlide(
        key: const ValueKey(26),
        title: 'DACs Externos — MCP4725',
        subtitle: 'Quando precisa de mais resolução e precisão',
        accentColor: const Color(0xFF8B5CF6),
        items: const [
          ContentItem(
            text: 'MCP4725: DAC I2C de 12 bits — 4096 níveis',
            icon: Icons.memory_rounded,
            iconColor: Color(0xFF8B5CF6),
            isBold: true,
          ),
          ContentItem(
            text: 'Endereço I2C: 0x60 ou 0x61 (configurável)',
            icon: Icons.tag_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text: 'Saída: 0V a VDD, rail-to-rail',
            icon: Icons.trending_up_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Velocidade: ~400 kHz I2C → ~10 ksps',
            icon: Icons.speed_rounded,
          ),
          ContentItem(
            text: 'EEPROM interna: armazena valor de power-on',
            icon: Icons.storage_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Biblioteca Arduino: Adafruit_MCP4725',
            icon: Icons.code_rounded,
          ),
          ContentItem(
            text: 'Custo: ~R\$5–15 (módulo breakout)',
            icon: Icons.attach_money_rounded,
          ),
          ContentItem(
            text: 'Alternativas: MCP4922 (SPI, 12-bit, dual), AD5620 (16-bit)',
            icon: Icons.compare_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
        ],
      );
    case 27:
      return const CodeSlide(
        key: ValueKey(27),
        title: 'MCP4725 — Código I2C',
        subtitle: 'ESP32 • Wire.h • DAC externo 12 bits',
        accentColor: Color(0xFF8B5CF6),
        code: '''#include <Wire.h>

#define MCP4725_ADDR 0x60

void setDAC(uint16_t val) {
  Wire.beginTransmission(MCP4725_ADDR);
  Wire.write((val >> 8) & 0x0F);  // 4 MSBs
  Wire.write(val & 0xFF);          // 8 LSBs
  Wire.endTransmission();
}

void setup() {
  Wire.begin(21, 22);  // SDA, SCL
  Serial.begin(115200);
}

void loop() {
  // Rampa 12 bits: 0 a 4095
  for (uint16_t v = 0; v < 4096; v++) {
    setDAC(v);
    delayMicroseconds(50);
  }
  delay(200);
}''',
        explanationPoints: [
          'MCP4725 via I2C (Wire.h)',
          '12 bits: 4096 níveis (vs 256 do DAC nativo)',
          'Escrita: 4 MSBs no primeiro byte, 8 LSBs no segundo',
          'Fast Write mode (sem EEPROM)',
          'I2C a 400 kHz → ~10 ksps',
          'Ideal para referências de tensão precisas',
        ],
      );
    case 28:
      return ContentSlide(
        key: const ValueKey(28),
        title: 'Boas Práticas',
        subtitle: 'Dicas para uso eficiente de DAC e PWM',
        accentColor: const Color(0xFF00D4AA),
        items: const [
          ContentItem(
            text:
                'Sempre use buffer (op-amp) na saída do DAC se a carga for variável',
            icon: Icons.shield_rounded,
            iconColor: Color(0xFF00D4AA),
            isBold: true,
          ),
          ContentItem(
            text: 'Para PWM+RC: fc << fPWM (pelo menos 10× menor)',
            icon: Icons.filter_alt_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text: 'Use lookup table pré-calculada para waveforms em tempo real',
            icon: Icons.table_chart_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text:
                'Teste com osciloscópio: visualize ripple, glitches, transientes',
            icon: Icons.monitor_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
          ContentItem(
            text:
                'Capacitor de desacoplamento (100nF) perto do VDD de DACs externos',
            icon: Icons.electrical_services_rounded,
          ),
          ContentItem(
            text:
                'Para áudio: use I2S + DAC externo (PCM5102A) — qualidade profissional',
            icon: Icons.headphones_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'DMA + timer para geração contínua sem intervenção da CPU',
            icon: Icons.memory_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
        ],
      );
    case 29:
      return ContentSlide(
        key: const ValueKey(29),
        title: 'Frequência vs Resolução — LEDC',
        subtitle: 'Restrição: freq × 2^bits ≤ 80 MHz',
        accentColor: const Color(0xFFF59E0B),
        items: const [
          ContentItem(
            text: 'APB Clock = 80 MHz — limite superior do LEDC',
            icon: Icons.speed_rounded,
            iconColor: Color(0xFFF59E0B),
            isBold: true,
          ),
          ContentItem(
            text: '1 kHz × 2^16 = 65.5 MHz → OK ✓ (16 bits a 1 kHz)',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: '5 kHz × 2^13 = 40.96 MHz → OK ✓ (13 bits a 5 kHz)',
            icon: Icons.check_circle_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text:
                '5 kHz × 2^16 = 327 MHz → FALHA ✗ (muito resolução para freq)',
            icon: Icons.cancel_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text:
                'Para áudio (44.1 kHz): máx ~11 bits (44.1k × 2^11 = 90.3 MHz)',
            icon: Icons.music_note_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
          ContentItem(
            text: 'Para LED (1 kHz): até 16 bits (65.5 MHz < 80 MHz)',
            icon: Icons.lightbulb_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Dica: use a maior resolução possível dentro do limite',
            icon: Icons.lightbulb_outline_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
        ],
      );
    case 30:
      return ContentSlide(
        key: const ValueKey(30),
        title: 'Troubleshooting',
        subtitle: 'Problemas comuns e soluções',
        accentColor: const Color(0xFFFF6B6B),
        items: const [
          ContentItem(
            text:
                'Saída DAC com offset: verificar GND comum, medir com multímetro',
            icon: Icons.troubleshoot_rounded,
            iconColor: Color(0xFFFF6B6B),
          ),
          ContentItem(
            text: 'PWM com alta jitter: usar canal high-speed (canais 0-7)',
            icon: Icons.warning_rounded,
            iconColor: Color(0xFFF59E0B),
          ),
          ContentItem(
            text: 'Ripple excessivo no RC: aumentar R ou C, ou usar 2ª ordem',
            icon: Icons.waves_rounded,
            iconColor: Color(0xFF3B82F6),
          ),
          ContentItem(
            text:
                'DAC externo não responde: verificar endereço I2C com Scanner',
            icon: Icons.search_rounded,
            iconColor: Color(0xFF8B5CF6),
          ),
          ContentItem(
            text:
                'Senoide distorcida: amostras insuficientes ou clipping nos extremos',
            icon: Icons.graphic_eq_rounded,
            iconColor: Color(0xFF00D4AA),
          ),
          ContentItem(
            text: 'Crosstalk entre canais PWM: desacoplar GND, separar trilhas',
            icon: Icons.cable_rounded,
          ),
        ],
      );
    case 31:
      return CardsSlide(
        key: const ValueKey(31),
        title: 'Resumo e Próximos Passos',
        subtitle: 'Domine a geração de sinais analógicos na ESP32',
        accentColor: const Color(0xFF3B82F6),
        crossAxisCount: 3,
        cards: const [
          InfoCardData(
            title: 'DAC Nativo',
            description:
                '2 pinos (GPIO25/26), 8 bits, dacWrite(). Ideal para sinais simples.',
            icon: Icons.tune_rounded,
            color: Color(0xFF8B5CF6),
          ),
          InfoCardData(
            title: 'PWM (LEDC)',
            description:
                '16 canais, 1-20 bits, qualquer GPIO. Controle de potência e duty cycle.',
            icon: Icons.waves_rounded,
            color: Color(0xFFF59E0B),
          ),
          InfoCardData(
            title: 'PWM + Filtro RC',
            description:
                'Converte PWM em analógico. Mais resolução que o DAC nativo.',
            icon: Icons.filter_alt_rounded,
            color: Color(0xFF00D4AA),
          ),
          InfoCardData(
            title: 'PWM Dual 16-bit',
            description:
                '2 canais + rede resistiva. 65.536 níveis sem hardware externo.',
            icon: Icons.precision_manufacturing_rounded,
            color: Color(0xFF3B82F6),
          ),
          InfoCardData(
            title: 'DAC Externo',
            description: 'MCP4725 (12-bit I2C). Máxima precisão e linearidade.',
            icon: Icons.memory_rounded,
            color: Color(0xFFFF6B6B),
          ),
          InfoCardData(
            title: 'Próxima Aula',
            description: 'Cálculo RMS na ESP32 — medição de sinais AC.',
            icon: Icons.arrow_forward_rounded,
            color: Color(0xFF34D399),
          ),
        ],
      );
    default:
      return Center(
        key: ValueKey(index),
        child: Text(
          'Slide ${index + 1}',
          style: const TextStyle(color: Colors.white38, fontSize: 22),
        ),
      );
  }
}
