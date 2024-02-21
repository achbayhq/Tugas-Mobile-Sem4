import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const VolumeBangunRuang());
}

class VolumeBangunRuang extends StatefulWidget {
  const VolumeBangunRuang({super.key});

  @override
  State<VolumeBangunRuang> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VolumeBangunRuang> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();

  List<String> bangunRuang = ["Kubus", "Balok", "Tabung"];
  String selectedBangunRuang = "Kubus";

  void hitungVolume() {
    double value1 = text1.text.isEmpty ? 0.0 : double.parse(text1.text);
    double value2 = text2.text.isEmpty ? 0.0 : double.parse(text2.text);
    double value3 = text3.text.isEmpty ? 0.0 : double.parse(text3.text);
    double? volume;

    if (selectedBangunRuang == "Kubus") {
      volume = value1 * value1 * value1;
    } else if (selectedBangunRuang == "Balok") {
      volume = value1 * value2 * value3;
    } else if (selectedBangunRuang == "Tabung") {
      volume = value1 * (value2 * 2) * value3;
    }
    setState(() {
      text4.text = volume.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          DropdownButtonFormField(
            value: selectedBangunRuang,
            items: bangunRuang
                .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                selectedBangunRuang = val as String;
                text1.clear();
                text2.clear();
                text3.clear();
                text4.clear();
                if (selectedBangunRuang == "Tabung") {
                  text1.text = "3.14";
                }
              });
            },
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.black,
            ),
            dropdownColor: Colors.white,
            decoration: const InputDecoration(
                labelText: "Bangun Ruang", border: UnderlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextField(
              controller: text1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 3.0),
                ),
                labelText: selectedBangunRuang == 'Balok'
                    ? "Panjang"
                    : selectedBangunRuang == 'Tabung'
                        ? "pi (π)"
                        : "Sisi Kubus",
              ),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          TextField(
              controller: selectedBangunRuang == 'Kubus' ? text1 : text2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 3.0),
                ),
                labelText: selectedBangunRuang == 'Balok'
                    ? "Lebar"
                    : selectedBangunRuang == 'Tabung'
                        ? "Jari-jari"
                        : "Sisi Kubus",
              ),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          TextField(
              controller: selectedBangunRuang == 'Kubus' ? text1 : text3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 3.0),
                ),
                labelText: selectedBangunRuang == 'Balok'
                    ? "Tinggi"
                    : selectedBangunRuang == 'Tabung'
                        ? "Tinggi"
                        : "Sisi Kubus",
              ),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.normal)),
          const SizedBox(height: 25),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[200],
                  minimumSize: const Size(300, 50),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
              onPressed: hitungVolume,
              child: const Text("Hitung Volume Bangun Ruang")),
          const SizedBox(height: 20),
          TextField(
              controller: text4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 3.0),
                  ),
                  labelText: "Hasil Volume"),
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.normal)),
        ]),
      )),
    );
  }
}
