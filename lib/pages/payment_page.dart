import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _cardholderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryMonthController = TextEditingController();
  final _expiryYearController = TextEditingController();
  final _cvvController = TextEditingController();
  final _amountController = TextEditingController();
  String _validationError = '';
  bool _isLoading = false;
  double _lacking = 0.0; // Предположим, что это значение передается извне

  Future<void> _handlePayment() async {
    setState(() {
      _isLoading = true;
      _validationError = '';
    });

    // Basic validation
    if (_cardholderNameController.text.isEmpty ||
        _cardNumberController.text.isEmpty ||
        _expiryMonthController.text.isEmpty ||
        _expiryYearController.text.isEmpty ||
        _cvvController.text.isEmpty ||
        _amountController.text.isEmpty) {
      setState(() {
        _validationError = 'Please fill in all fields';
        _isLoading = false;
      });
      return;
    }

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
    // Navigate to success page or show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment successful!')),
    );

    Navigator.pushReplacementNamed(context, '/account');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cardholder Name Field
              const Text(
                'Имя держателя:',
                style: TextStyle(color: Color(0xFF676767)),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _cardholderNameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Color(0xFF676767)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                style: const TextStyle(color: Color(0xFF676767)),
              ),

              const SizedBox(height: 20),

              // Card Number Field
              const Text(
                'Номер карты:',
                style: TextStyle(color: Color(0xFF676767)),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  hintText: 'Card Number',
                  hintStyle: TextStyle(color: Color(0xFF676767)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Color(0xFF676767)),
              ),

              const SizedBox(height: 20),

              // Expiry Date and CVV Fields
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Дата:',
                          style: TextStyle(color: Color(0xFF676767)),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _expiryMonthController,
                                decoration: const InputDecoration(
                                  hintText: 'MM',
                                  hintStyle: TextStyle(color: Color(0xFF676767)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 16.0,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Color(0xFF676767)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '/',
                              style: TextStyle(fontSize: 30),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _expiryYearController,
                                decoration: const InputDecoration(
                                  hintText: 'YY',
                                  hintStyle: TextStyle(color: Color(0xFF676767)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 16.0,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Color(0xFF676767)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVV:',
                          style: TextStyle(color: Color(0xFF676767)),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _cvvController,
                          decoration: const InputDecoration(
                            hintText: '000',
                            hintStyle: TextStyle(color: Color(0xFF676767)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Color(0xFF676767)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Amount Field
              const Text(
                'Сумма:',
                style: TextStyle(color: Color(0xFF676767)),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                  hintStyle: TextStyle(color: Color(0xFF676767)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Color(0xFF676767)),
              ),

              const SizedBox(height: 20),

              // Pay Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handlePayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Оплатить',
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Lacking Message
              if (_lacking > 0)
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA9D0F8),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Не хватает для оплаты на сайте: $_lacking',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),

              // Validation Error
              if (_validationError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _validationError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cardholderNameController.dispose();
    _cardNumberController.dispose();
    _expiryMonthController.dispose();
    _expiryYearController.dispose();
    _cvvController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
