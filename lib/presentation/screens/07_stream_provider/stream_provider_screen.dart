import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChatAsyn = ref.watch(usersInChatProvider);

    if (usersInChatAsyn.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (usersInChatAsyn.hasError) {
      return Center(
        child: Text(usersInChatAsyn.error.toString()),
      );
    }

    final users = usersInChatAsyn.value!;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index]),
        );
      },
    );
  }
}
