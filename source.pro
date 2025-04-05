% AI Chatbot with Synonym Handling (Prolog)

% Knowledge Base for AI Chatbot (Prolog)

% Fundamentals of AI
ai_definition("What is Artificial Intelligence?", "Artificial Intelligence (AI) is the simulation of human intelligence processes by machines, especially computer systems.").
ml_definition("What is Machine Learning?", "Machine Learning (ML) is a subset of AI that allows computers to learn from data without explicit programming.").
dl_definition("What is Deep Learning?", "Deep Learning (DL) is a subset of ML that uses neural networks to learn from large amounts of data.").

% AI Applications
ai_application("What are some applications of AI?", "AI is used in recommendation systems, voice assistants, spam filters, and many other areas.").
nlp_application("What is NLP?", "NLP stands for Natural Language Processing, which enables computers to understand human language.").
computer_vision_application("What is Computer Vision?", "Computer Vision allows computers to 'see' and interpret images and videos.").
reinforcement_learning_application("What is reinforcement learning?", "Reinforcement learning is a type of machine learning where an agent learns through rewards and penalties in an environment.").

% Ethical Considerations
ethical_concern("What are some ethical concerns about AI?", "Ethical concerns include bias, job displacement, and the need for responsible development.").

% History and People
ai_pioneer("Who is Alan Turing?", "Alan Turing was a British mathematician and computer scientist considered one of the fathers of computer science and AI.").
turing_test("What is the Turing Test?", "The Turing Test is a measure of a machine's ability to exhibit intelligent behavior indistinguishable from that of a human.").

% More Specific Questions
ml_how_works("How does machine learning work?", "Machine learning algorithms learn patterns from data. For example, to recognize cats in pictures, you show the algorithm many cat pictures. Over time, it learns to identify cat features.").
neural_networks("What are neural networks?", "Neural networks are machine learning models inspired by the human brain, made of interconnected nodes.").
ai_ml_difference("What is the difference between AI and ML?", "AI is the broad concept of machines performing intelligent tasks. ML is a specific approach where machines learn from data.").

% Synonym Handling
synonym("ml", "machine learning").
synonym("ML", "machine learning").
synonym("learning machines", "machine learning").
synonym("NLP", "Natural Language Processing").
synonym("DL","Deep Learning").
synonym("deep learning", "Deep Learning").

% Chatbot Logic

answer(Question, Answer) :-
    synonym(Question, StandardQuestion),
    !, % cut, prevent backtracking
    answer(StandardQuestion, Answer). % recursive call with standard question

answer(Question, Answer) :-
    ai_definition(Question, Answer);
    ml_definition(Question, Answer);
    dl_definition(Question, Answer);
    ai_application(Question, Answer);
    nlp_application(Question, Answer);
    computer_vision_application(Question, Answer);
    reinforcement_learning_application(Question,Answer);
    ethical_concern(Question, Answer);
    ai_pioneer(Question, Answer);
    turing_test(Question, Answer);
    ml_how_works(Question, Answer);
    neural_networks(Question, Answer);
    ai_ml_difference(Question, Answer);
    % Add more rules for other questions.
    !. %Cut, to stop after first match

answer(Question, "I don't have information about that. Please ask another question."). % Default answer.

% Preprocessing (Basic - lowercasing)

preprocess(Question, LowerCaseQuestion) :-
    downcase_atom(Question, LowerCaseQuestion).

% Main Chatbot Interaction

chatbot :-
    repeat,
    write('You: '),
    read_line_to_string(user_input, RawQuestion),
    preprocess(RawQuestion, Question),
    answer(Question, Answer),
    write('Chatbot: '),
    writeln(Answer),
    (RawQuestion = "exit" -> ! ; fail). % exit condition
write('Hello!'),nl,write('Ask me anything about Artificial Intellegent').

% Example Queries:
% ?- chatbot.
% ?- answer("What is Machine Learning?", Answer).
% ?- answer("who is alan turing?", Answer).
% ?- answer("ml", Answer).
% ?- answer("What is a flying purple elephant?", Answer). %Example of default.