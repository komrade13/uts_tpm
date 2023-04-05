import 'package:flutter/material.dart';

class GeometryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Trapezoid'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrapezoidPage()),
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Cylinder'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CylinderPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidPage extends StatefulWidget {
  @override
  _TrapezoidPageState createState() => _TrapezoidPageState();
}

class _TrapezoidPageState extends State<TrapezoidPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _dController = TextEditingController();

  double _area = 0.0;
  double _perimeter = 0.0;

  void _calculate() {
    double a = double.parse(_aController.text);
    double b = double.parse(_bController.text);
    double c = double.parse(_cController.text);
    double d = double.parse(_dController.text);

    double height = c * c - ((b - a) * (b - a) + c * c - d * d) / (2 * (b - a));
    double area = (a + b) / 2 * height;
    double perimeter = a + b + c + d;

    setState(() {
      _area = area;
      _perimeter = perimeter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapezoid Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Length of side a',
              ),
            ),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Length of side b',
              ),
            ),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Length of side c',
              ),
            ),
            TextField(
              controller: _dController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Length of side d',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Calculate'),
              onPressed: () {
                _calculate();
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Area: $_area',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Perimeter: $_perimeter',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

class CylinderPage extends StatefulWidget {
  @override
  _CylinderPageState createState() => _CylinderPageState();
}

class _CylinderPageState extends State<CylinderPage> {
  final TextEditingController _radiusController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double _volume = 0.0;
  double _surfaceArea = 0.0;

  void _calculate() {
    double radius = double.parse(_radiusController.text);
    double height = double.parse(_heightController.text);

    double volume = 3.14 * radius * radius * height;
    double surfaceArea = 2 * 3.14 * radius * (height + radius);

    setState(() {
      _volume = volume;
      _surfaceArea = surfaceArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cylinder Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Radius',
              ),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Calculate'),
              onPressed: () {
                _calculate();
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Volume: $_volume',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Surface Area: $_surfaceArea',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

