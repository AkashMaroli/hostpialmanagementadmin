import 'package:flutter/material.dart';

class Invoice {
  final String invoiceNo;
  final String customerName;
  final String mobile;
  final double amount;
  final DateTime dateInfo;
  final TimeOfDay time;
  final String status;
  final String department;

  Invoice(
    this.invoiceNo,
    this.customerName,
    this.mobile,
    this.amount,
    this.dateInfo,
    this.department,
    this.time,
    this.status,
  );
}

class InvoiceListScreen extends StatefulWidget {
  const InvoiceListScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  late List<Invoice> _patientsPayments;
  String _activeTab = 'Completed';
  bool _selectAll = false;
  final List<String> _selectedPatients = [];

  @override
  void initState() {
    super.initState();
    // Load dynamic data
    _patientsPayments = _getDummyPatients();
  }

  List<Invoice> _getDummyPatients() {
    // This would typically come from an API or database
    return [
      Invoice(
        '6B1E73DA-0017',
        'Jane Cooper',
        '+91 3356 8462',
        125,
        DateTime(2024, 7, 27),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Jenny Wilson',
        '+91 3356 8462',
        952,
        DateTime(2024, 8, 27),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Robert Fox',
        '+91 3356 8462',
        650,
        DateTime(2024, 11, 27),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Cody Fisher',
        '+91 3356 8462',
        392,
        DateTime(2024, 7, 7),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Wade Warren',
        '+91 3356 8462',
        292,
        DateTime(2024, 7, 17),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Annette Black',
        '+91 3356 8462',
        369,
        DateTime(2024, 7, 11),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Leslie Alexander',
        '+91 3356 8462',
        652,
        DateTime(2024, 10, 10),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Annette Black',
        '+91 3356 8462',
        369,
        DateTime(2024, 7, 11),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
      Invoice(
        '6B1E73DA-0017',
        'Leslie Alexander',
        '+91 3356 8462',
        652,
        DateTime(2024, 10, 10),
        'Orthopaedic',
        TimeOfDay(hour: 11, minute: 30),
        'Completed',
      ),
    ];
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green.shade100;
      case 'today':
        return Colors.blue.shade100;
      case 'pending':
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'today':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildTabBar(),
            const SizedBox(height: 16),
            Expanded(
              child: _activeTab == 'Completed'
                  ? _buildPatientsRecordsView()
                  : _activeTab == 'Due'
                      ? _buildAddDetailsView()
                      : _buildEditDetailsView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientsRecordsView() {
    return Column(
      children: [
        _buildTableHeader(),
        Expanded(child: _buildPatientList()),
      ],
    );
  }

  Widget _buildAddDetailsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person_add_alt_1_rounded,
            size: 80,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 24),
          Text(
            'Due',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Use this page to show due payments details to the system',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildEditDetailsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.edit_note_rounded,
            size: 80,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 24),
          Text(
            'All Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Show all payments information in the system',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Check your Patients Payment List',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_download_outlined),
              label: const Text('Export'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _activeTab = 'Due';
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: [
        _buildTab('Completed'),
        const SizedBox(width: 16),
        _buildTab('Due'),
        const SizedBox(width: 16),
        _buildTab('All Details'),
      ],
    );
  }

  Widget _buildTab(String title) {
    final isActive = _activeTab == title;
    return InkWell(
      onTap: () {
        setState(() {
          _activeTab = title;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.deepPurple : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 120,
            color: isActive ? Colors.deepPurple : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Fixed table header with consistent column widths
  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Invoice No:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Patients Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Mobile',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Department',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Time',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Action',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // Patient list with matching column flexes
  Widget _buildPatientList() {
    return ListView.builder(
      itemCount: _patientsPayments.length,
      itemBuilder: (context, index) {
        final patientPayment = _patientsPayments[index];

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              // Invoice No
              Expanded(
                flex: 2,
                child: Text(
                  patientPayment.invoiceNo,
                  textAlign: TextAlign.center,
                ),
              ),
              // Patient Name
              Expanded(
                flex: 3,
                child: Text(
                  patientPayment.customerName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              // Mobile
              Expanded(
                flex: 3,
                child: Text(
                  patientPayment.mobile,
                  textAlign: TextAlign.center,
                ),
              ),
              // Department
              Expanded(
                flex: 3,
                child: Text(
                  patientPayment.department,
                  textAlign: TextAlign.center,
                ),
              ),
              // Date
              Expanded(
                flex: 2,
                child: Text(
                  _formatDate(patientPayment.dateInfo),
                  textAlign: TextAlign.center,
                ),
              ),
              // Time
              Expanded(
                flex: 2,
                child: Text(
                  _formatTime(patientPayment.time),
                  textAlign: TextAlign.center,
                ),
              ),
              // Status
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(patientPayment.status),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      patientPayment.status,
                      style: TextStyle(
                        color: _getStatusTextColor(patientPayment.status),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // Action
              Expanded(
                flex: 1,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      // Show action menu
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPageButton(int page) {
    final isActive = _currentPage == page;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _currentPage = page;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.deepPurple : Colors.white,
          foregroundColor: isActive ? Colors.white : Colors.black,
          elevation: 0,
          side: BorderSide(
            color: isActive ? Colors.transparent : Colors.grey.shade300,
          ),
          shape: const CircleBorder(),
          minimumSize: const Size(40, 40),
        ),
        child: Text(page.toString()),
      ),
    );
  }
}