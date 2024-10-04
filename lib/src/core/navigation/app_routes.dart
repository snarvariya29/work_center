enum AppRoutes {
  login('login'),
  signup('signup'),
  home('home'),
  createJob('create-job'),
  workerHome('worker-home');

  final String name;
  const AppRoutes(this.name);
}
