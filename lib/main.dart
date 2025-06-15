import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Image Assignment',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LVLYN', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF6A67FF), // Purple shade for the AppBar
          foregroundColor: Colors.white, // White text color
        ),

        // Main body of the app
        body: Stack(
          children: [
            // 🖼️ First image: from assets (local)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      75,
                    ), // Makes it circular
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45, // Soft shadow color
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  // Clip the image inside the border radius
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Image.asset(
                      'assets/Eren.jpg',
                      fit: BoxFit.cover, // Cover the box properly
                    ),
                  ),
                ),
              ),
            ),

            // 🌐 Second image: from the internet (network)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90), // Circular shape
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90), // Match container
                    child: Image.network(
                      'https://tse2.mm.bing.net/th?id=OIP.NwKTqvaHnRxlJoOehOO_mgHaFn&pid=Api&P=0&h=220', // Any random image URL
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        // Show a loading spinner while the image loads
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        // If image fails to load, show an error icon
                        return Center(
                          child: Icon(Icons.error, size: 48, color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
