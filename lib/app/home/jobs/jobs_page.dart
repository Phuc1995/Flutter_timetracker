import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/home/jobs/edit_job_page.dart';
import 'package:time_tracker/app/home/jobs/empty_content.dart';
import 'package:time_tracker/app/home/jobs/job_list_tile.dart';
import 'package:time_tracker/app/home/jobs/list_items_builder.dart';
import 'package:time_tracker/app/home/model/job.dart';
import 'package:time_tracker/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/database.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
            title: "Logout",
            cancelActionText: "Cancel",
            content: "Are you sure that you want to logout?",
            defaultActionText: "Logout")
        .show(context);
    if (didRequestSignOut == true) {
      print("phuc test: true");
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    database.jobsStream();
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        actions: [
          FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () => _confirmSignOut(context))
        ],
      ),
      body: _buildContent(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditJobPage.show(context),
      ),
    );
  }

  Future<void> _createJobs(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context);
      await database.setJob(Job(name: "phuc", ratePerHour: 30));
    } on FirebaseException catch (e) {
      PlatformAlertDialog(
        title: 'Operation failed',
        content: e.message,
        defaultActionText: 'OK',
      ).show(context);
    }
  }

  Widget _buildContent(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Job>(
          snapshot: snapshot,
          itemBuilder: (context, job) => JobListTile(
            job: job,
            onTap: () => EditJobPage.show(
              context,
              job: job,
            ),
          ),
        );
      },
    );
  }
}
