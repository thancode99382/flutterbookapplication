import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart'; // Import thư viện confetti

class InforCompletedOder extends StatefulWidget {
  const InforCompletedOder({super.key});

  @override
  _InforCompletedOderState createState() => _InforCompletedOderState();
}

class _InforCompletedOderState extends State<InforCompletedOder> {
  late ConfettiController _controller; // Khai báo controller cho hiệu ứng confetti

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 1)); // Khởi tạo controller
    _controller.play(); // Bắt đầu hiệu ứng khi trang hiển thị
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng controller khi widget không còn sử dụng
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: Text(
          'Thanh toán ',
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Hiệu ứng confetti được thêm vào
          ConfettiWidget(
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive, // Hướng của confetti
            shouldLoop: true,
            colors: const [Colors.green, Colors.red, Colors.blue, Colors.yellow, Colors.black],
            numberOfParticles: 100, // Số lượng hạt confetti
            gravity: 0.2, // Lực hấp dẫn
          ),
          // Nội dung chính của trang
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
              crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
              children: [
                const Icon(Icons.check, size: 100, color: Colors.green),
                Text(
                  'Cảm ơn bạn đã mua hàng ',
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Bạn đã đạt hàng thành công',
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
