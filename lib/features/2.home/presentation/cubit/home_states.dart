abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class ChangeIndexState extends HomeStates{}

class LogoutLoading extends HomeStates{}
class LogoutSuccess extends HomeStates{}
class LogoutError extends HomeStates{}

class SendComplaintsLoading extends HomeStates{}
class SendComplaintsSuccess extends HomeStates{}
class SendComplaintsError extends HomeStates{}

class GetComplaintsListLoading extends HomeStates{}
class GetComplaintsListSuccess extends HomeStates{}
class GetComplaintsListError extends HomeStates{}